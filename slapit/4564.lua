if sysbench.cmdline.command == nil then
   error("Command is required. Supported commands: run")
end

sysbench.cmdline.options = {
	skip_trx = {"Do not use BEGIN/COMMIT; Use global auto_commit value", false}
}

local select_counts = {
	"select * from (select distinct l_orderkey from (select l_orderkey from lineitem limit 5000000)s1)s2 limit 100;",
}

function execute_selects()
	for i, o in ipairs(select_counts) do
		con:query(o)
	end
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
