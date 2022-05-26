if sysbench.cmdline.command == nil then
   error("Command is required. Supported commands: run")
end

sysbench.cmdline.options = {
	skip_trx = {"Do not use BEGIN/COMMIT; Use global auto_commit value", false}
}

local select_counts = {
	"select SocialSourceNetworkID,count(SocialSourceNetworkID) from h1 where SocialSourceNetworkID = 1 or SocialSourceNetworkID < 5 group by 1 order by 1;",
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
