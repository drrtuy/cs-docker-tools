if sysbench.cmdline.command == nil then
   error("Command is required. Supported commands: run")
end

sysbench.cmdline.options = {
	skip_trx = {"Do not use BEGIN/COMMIT; Use global auto_commit value", false}
}

local select_counts = {
	"select category_code_key,count(*) from bd_dwhs_private_ex_pub_services_ins group by category_code_key LIMIT 100;",
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
