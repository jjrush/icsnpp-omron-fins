module OMRON_FINS;

    function set_session_general_log(c: connection): connection {
        if ( ! c?$omron_fins_general_log )
            c$omron_fins_general_log = general_log(
                $ts=network_time(),
                $uid=c$uid,
                $id=c$id,
                $proto="omron_fins");
        
        return c;
    }

    function set_session_detail_log(c: connection): connection {
        if ( ! c?$omron_fins_detail_log )
            c$omron_fins_detail_log = detail_log(
                $ts=network_time(),
                $uid=c$uid,
                $id=c$id);

        return c;
    }

    function process_command_and_datatype_detail(info_detail_log: detail_log, finsCommand: OMRON_FINS::Command): detail_log {

        info_detail_log$command_code  = OMRON_FINS_ENUMS::COMMAND[finsCommand$commandCode];
        info_detail_log$icf_data_type = OMRON_FINS_ENUMS::DATA_TYPE[finsCommand$icfDataType];

        return info_detail_log;
    }
