#!/tmp/busybox sh

cp light.prop temp.prop
file_path=./temp.prop

# Define the text to search for and the replacement text
search_start="ro.slmk.dha_cached_min=3"
search_end="persist.sys.zram.daily_quota_remain=131072"
replace_text="ro.slmk.dha_cached_min=3\nro.slmk.dha_cached_max=12\nro.slmk.dha_empty_min=8\nro.slmk.dha_empty_max=20\npersist.sys.kpm_onoff=false\nro.slmk.add_bonusEFK=2\nro.slmk.v_bonusEFK=51200\nro.slmk.cam_dha_ver=3\nro.slmk.dha_pwhl_key=520\nro.slmk.base_swaptotal=4096\nro.slmk.dha_2ndprop_thMB=4096\nro.slmk.2nd.dha_cached_max=16\nro.slmk.2nd.dha_empty_max=30\nro.slmk.psi_critical=120\nro.slmk.freelimit_val=13\nro.slmk.max_snapshot_num=3\nro.slmk.enable_userspace_lmk=true\nro.slmk.plg_memory_th=3072\nro.slmk.plg_key=1\nro.slmk.use_lowmem_keep_except=true\nro.slmk.dha_lmk_scale=0.494\nro.slmk.enable_upgrade_criadj=true\nro.slmk.cam_kill_start_minutes=30\nro.slmk.swap_free_low_percentage=47\nro.slmk.2nd.swap_free_low_percentage=10\nro.slmk.beks_enable=true\nro.slmk.beks_key=128\nro.slmk.trim_sec_policy=true\nro.slmk.chimera_strategy_3gb=650,5,4,885\npersist.sys.zram.daily_quota_remain=131072"

# Use sed to replace the text between search_start and search_end with replace_text
sed -i "/$search_start/,/$search_end/c\\r$replace_text" "$file_path"
