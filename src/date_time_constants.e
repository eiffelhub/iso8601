note
	component:   "EiffelHub ISO8601 Library"
	description: "Date/time constants"
	keywords:    "iso8601, date time"
	author:      "Thomas Beale"
	contributors:""
	support:     "iso8601 library tracker <https://github.com/eiffelhub/iso8601/issues>"
	copyright:   "Copyright (c) 2000- Thomas Beale <http://wolandscat.net>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DATE_TIME_CONSTANTS

inherit
	KL_GREGORIAN_CALENDAR

feature -- Definitions

	Default_time_format: STRING = "[0]hh:[0]mi:[0]ss"
			-- Example: "22:03:10"

	Default_date_format: STRING = "yyyy-[0]mm-[0]dd"
			-- Example: "1998-08-25"

	Middle_second_in_minute: INTEGER = 30

	Middle_minute_in_hour: INTEGER = 30

	Middle_day_of_month: INTEGER = 15

	Middle_month_of_year: INTEGER = 6

	Last_day_of_middle_month: INTEGER = 30

	Max_timezone_hour: INTEGER = 12

	Origin_year: INTEGER = 1600

end


