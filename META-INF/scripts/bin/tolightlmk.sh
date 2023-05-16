#!/tmp/busybox sh

cp light.prop temp.prop
file_path=./temp.prop

# Define the text to search for and the replacement text
search_start="ro.slmk.dha_cached_min=3"
search_end="persist.sys.zram.daily_quota_remain=131072"
replace_text="ro.slmk.dha_cached_min=3\nro.slmk.dha_cached_max=4\nro.slmk.dha_empty_min=2\nro.slmk.dha_empty_max=14\nro.slmk.add_bonusEFK=2\nro.slmk.v_bonusEFK=20480\nro.slmk.max_snapshot_num=2\nro.slmk.fha_enable=true\nro.slmk.upgrade_pressure=60\nro.slmk.custom_sw_limit=250\nro.slmk.enable_userspace_lmk=false\nro.slmk.kill_heaviest_task=true\nro.slmk.custom_tm_limit=1000\nro.slmk.freelimit_val=11\nro.slmk.remove_contact_except_list=true\nro.slmk.use_lowmem_keep_except=true\nro.slmk.dha_pwhl_key=512\nro.slmk.beks_enable=true\nro.slmk.beks_key=4\nro.slmk.provider_upgrade_adj=true\nro.slmk.enable_reentry_lmk=true\nro.slmk.chimera_strategy_3gb=650,5,4,885\npersist.sys.zram.daily_quota_remain=131072"

# Use sed to replace the text between search_start and search_end with replace_text
sed -i "/$search_start/,/$search_end/c\\r$replace_text" "$file_path"
