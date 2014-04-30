note
	component:   "EiffelHub ISO8601 Library"
	description: "Precursor to ISO8601 types, providing basic features allowing generic types to be defined."
	keywords:    "iso8601, date time"
	author:      "Thomas Beale"
	contributors:""
	support:     "iso8601 library tracker <https://github.com/eiffelhub/iso8601/issues>"
	copyright:   "Copyright (c) 2006- Thomas Beale <http://wolandscat.net>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class ISO8601_TYPE

inherit
	COMPARABLE

feature -- Initialisation

	make_from_string (str: STRING)
			-- make from any valid ISO date string
		require
			String_valid: valid_iso8601_string (str)
		deferred
		end

feature -- Access

	value: STRING
			-- ISO8601 string for date; always equal to result of as_string

feature -- Status Report

	valid_iso8601_string (str: STRING): BOOLEAN
		deferred
		end

feature -- Output

	as_string: STRING
			-- express as string of ISO8601 format
		deferred
		ensure
			Result_valid: valid_iso8601_string (Result)
		end

end


