local augend = require("dial.augend")
require("dial.config").augends:register_group{
  default = {
    augend.integer.alias.decimal_int,
    augend.integer.alias.hex,
    augend.date.alias["%Y/%m/%d"],
	augend.date.alias["%Y-%m-%d"],
	augend.date.alias["%Y年%-m月%-d日"],
	augend.date.alias["%Y年%-m月%-d日(%ja)"],
	augend.date.alias["%m/%d"],
	augend.date.alias["%-m/%-d"],
	augend.date.alias["%H:%M:%S"],
	augend.date.alias["%H:%M"],
	augend.constant.alias.ja_weekday,
	augend.constant.alias.ja_weekday_full,
	augend.constant.alias.bool,
	augend.semver.alias.semver,
	augend.constant.new{
	  elements = {"HIGH", "LOW"},
	  word = true,
	  cyclic = true,
	},
	augend.constant.new{
	  elements = {"On", "Off"},
	  word = true,
	  cyclic = true,
	},
  },
}
