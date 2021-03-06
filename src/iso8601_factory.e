note
	component:   "EiffelHub ISO8601 Library"
	description: "ISO 8601 Date/time factory for use in interfaces that need to be able to create ISO date/times from strings"
	keywords:    "iso8601, date, time"
	author:      "Thomas Beale"
	contributors:""
	support:     "iso8601 library tracker <https://github.com/eiffelhub/iso8601/issues>"
	copyright:   "Copyright (c) 2006- Thomas Beale <http://wolandscat.net>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ISO8601_FACTORY

inherit
	ISO8601_ROUTINES

feature -- Conversion

	create_iso8601_date (str: STRING): ISO8601_DATE
			-- make from string using ISO8601 format "YYYY-MM-DD"
		require
			str_valid: valid_iso8601_date(str)
		do
			create Result.make_from_string(str)
		end

	create_iso8601_time (str: STRING): ISO8601_TIME
			-- make from string using ISO8601 format "Thh:mm:ss[.ssss]"
		require
			str_valid: valid_iso8601_time(str)
		do
			create Result.make_from_string(str)
		end

	create_iso8601_date_time (str: STRING): ISO8601_DATE_TIME
			-- make from string using ISO8601 format "YYYY-MM-DDThh:mm:ss[.ssss]"
		require
			str_valid: valid_iso8601_date_time(str)
		do
			create Result.make_from_string(str)
		end

	create_iso8601_duration (str: STRING): ISO8601_DURATION
			-- make from string using ISO8601 format "PNNDTNNhNNmNNs"
		require
			str_valid: valid_iso8601_duration(str)
		do
			create Result.make_from_string (str)
		end

end


