if sysbench.cmdline.command == nil then
   error("Command is required. Supported commands: run")
end

sysbench.cmdline.options = {
	skip_trx = {"Do not use BEGIN/COMMIT; Use global auto_commit value", false}
}

local select = {
	"select s from (select count(*) as s from flights group by tail_num)sub;",
    "select s from (select count(*) as s from flights group by taxi_in)sub;",
    "select s from (select count(*) as s from flights)sub;",
}
local select_month_year = {
    "select tail_num from flights where year=%d and month=%d group by tail_num LIMIT 10;",
    "select tail_num from flights where year=%d and month=%d group by tail_num;",
}

local intFilterQuery = "select s from (select count(*) as s from flights where taxi_in=%d group by taxi_in)sub;"
local charFilterQuery = "select s from (select count(*) as s from flights where tail_num='%s')sub;"

function execute_selects()
	for i, o in ipairs(select) do
		con:query(o)
	end
    local randMonthYearQuery = select_month_year[math.random(#select_month_year)]
    local year = math.random(2019,2020)
    local month = math.random(1,12)
    con:query(string.format(randMonthYearQuery, year, month))
    local taxi_in = math.random(1,256)
    con:query(string.format(intFilterQuery, taxi_in))
    local tail_num = sysbench.rand.string(string.rep("@", sysbench.rand.special(3,6)))
    con:query(string.format(charFilterQuery, tail_num))
end

-- Called by sysbench to initialize script
function thread_init()

	-- globals for script
	drv = sysbench.sql.driver()
	con = drv:connect()
end


-- Called by sysbench when tests are done
function thread_done()

	con:disconnect()
end


-- Called by sysbench for each execution
function event()

	execute_selects()
end
