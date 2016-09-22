class Match < ApplicationRecord
  belongs_to :game
  has_many :match_players
  has_many :players,through: :match_players

  filterrific(
  default_filter_params: { sorted_by: 'created_at_desc' },
  available_filters: [
    :sorted_by,
    :search_query,
    :with_game_id,
    :with_created_at_gte
  ]
)
####################################################################
scope :sorted_by, lambda { |sort_option|
  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
  case sort_option.to_s
  when /^name/
    order("LOWER(match.name) #{ direction }")
  when /^email/
    order("LOWER(match.language) #{ direction }")
  when /^country/
    order("LOWER(match.game) #{ direction }")
  when /^registered_at/
    order("LOWER(match.decorated_created_at) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
}

scope :with_game_id, lambda { |game_ids|
  where(game_id: [*game_ids])
}

# filters on 'gender' attribute
scope :with_gender, lambda { |genders|
  where(gender: [*genders])
}

scope :with_game_name, lambda { |game_name|
  where(game: { name: game_name }).joins(:game)
}

# or sanitized SQL snippets for more complex needs (e.g., greater than)
scope :with_game_name, lambda { |game_name|
  where('games.name = ?', country_name).joins(:game)
}
  scope :search_query, lambda { |query|
    # Searches the match   table on the 'first_name' and 'last_name' columns.
    # Matches using LIKE, automatically appends '%' to each term.
    # LIKE is case INsensitive with MySQL, however it is case
    # sensitive with PostGreSQL. To make it work in both worlds,
    # we downcase everything.
    return nil  if query.blank?

    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)

    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conds = 2
    where(
      terms.map { |term|
        "(LOWER(students.first_name) LIKE ? OR LOWER(matches.last_name) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      # Simple sort on the created_at column.
      # Make sure to include the table name to avoid ambiguous column names.
      # Joining on other tables is quite common in Filterrific, and almost
      # every ActiveRecord table has a 'created_at' column.
      order("matches.created_at #{ direction }")
    when /^name_/
      # Simple sort on the name colums
      order("LOWER(matches.name) #{ direction }, LOWER(matches.name) #{ direction }")
    when /^game_name_/
      # This sorts by a student's country name, so we need to include
      # the country. We can't use JOIN since not all matches might have
      # a country.
      order("LOWER(games.name) #{ direction }").includes(:game)
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  scope :with_comments, lambda {
    where(
      'EXISTS (SELECT 1 from comments WHERE match.id = comments.match_id)'
    )
  }

  scope :with_comments_since, lambda { |reference_time|
  where([
    %(
      EXISTS (
        SELECT 1
          FROM comments
         WHERE match.id = comments.match_id
           AND comments.created_at >= ?)
    ),
    reference_time
  ])
}
scope :without_comments, lambda {
  where(
    %(NOT EXISTS (
      SELECT 1 FROM comments WHERE comments.match_id = match.id
    ))
  )
}

scope :with_any_role_ids, lambda{ |role_ids|
  # get a reference to the join table
  role_assignments = RoleAssignment.arel_table
  # get a reference to the filtered table
  students = Match.arel_table
  # let AREL generate a complex SQL query
  where(
    RoleAssignment \
      .where(role_assignments[:match_id].eq(match[:id])) \
      .where(role_assignments[:role_id].in([*role_ids].map(&:to_i))) \
      .exists
  )
}

scope :created_at_gte, lambda { |reference_time|
  where('match  .created_at >= ?', reference_time)
}

# always exclude the upper boundary for semi open intervals
scope :created_at_lt, lambda { |reference_time|
  where('match  .created_at < ?', reference_time)
}
#####################################################################
def self.options_for_sorted_by
  [
    ['Name (a-z)', 'name_asc'],
    ['Registration date (newest first)', 'created_at_desc'],
    ['Registration date (oldest first)', 'created_at_asc'],
    ['Game (a-z)', 'game_name_asc']
  ]
end
end
