#!/bin/bash

set -e

# define path
export PATH="/bin:/usr/bin:$PATH"

DIR_SRC_PLUGIN='/usr/share/munin/plugins'
DIR_DEP_PLUGIN='/etc/munin/plugins'

# delete all plugins and recreate
rm -f -v $DIR_DEP_PLUGIN/*

# NOTE: plugins we want to enable
# cpu -> /usr/share/munin/plugins/cpu
# df -> /usr/share/munin/plugins/df
# df_inode -> /usr/share/munin/plugins/df_inode
# entropy -> /usr/share/munin/plugins/entropy
# forks -> /usr/share/munin/plugins/forks
# fw_packets -> /usr/share/munin/plugins/fw_packets
# if_err_eth0 -> /usr/share/munin/plugins/if_err_
# if_eth0 -> /usr/share/munin/plugins/if_
# interrupts -> /usr/share/munin/plugins/interrupts
# iostat -> /usr/share/munin/plugins/iostat
# irqstats -> /usr/share/munin/plugins/irqstats
# load -> /usr/share/munin/plugins/load
# memory -> /usr/share/munin/plugins/memory
# open_files -> /usr/share/munin/plugins/open_files
# open_inodes -> /usr/share/munin/plugins/open_inodes
# processes -> /usr/share/munin/plugins/processes
# proc_pri -> /usr/share/munin/plugins/proc_pri
# swap -> /usr/share/munin/plugins/swap
# threads -> /usr/share/munin/plugins/threads
# uptime -> /usr/share/munin/plugins/uptime
# vmstat -> /usr/share/munin/plugins/vmstat

# recreate
ln -s -v $DIR_SRC_PLUGIN/cpu         $DIR_DEP_PLUGIN/cpu
ln -s -v $DIR_SRC_PLUGIN/df          $DIR_DEP_PLUGIN/df
ln -s -v $DIR_SRC_PLUGIN/df_inode    $DIR_DEP_PLUGIN/df_inode
ln -s -v $DIR_SRC_PLUGIN/entropy     $DIR_DEP_PLUGIN/entropy
ln -s -v $DIR_SRC_PLUGIN/forks       $DIR_DEP_PLUGIN/forks
ln -s -v $DIR_SRC_PLUGIN/fw_packets  $DIR_DEP_PLUGIN/fw_packets
ln -s -v $DIR_SRC_PLUGIN/if_err_     $DIR_DEP_PLUGIN/if_err_eth0
ln -s -v $DIR_SRC_PLUGIN/if_         $DIR_DEP_PLUGIN/if_eth0
ln -s -v $DIR_SRC_PLUGIN/interrupts  $DIR_DEP_PLUGIN/interrupts
ln -s -v $DIR_SRC_PLUGIN/iostat      $DIR_DEP_PLUGIN/iostat
ln -s -v $DIR_SRC_PLUGIN/irqstats    $DIR_DEP_PLUGIN/irqstats
ln -s -v $DIR_SRC_PLUGIN/load        $DIR_DEP_PLUGIN/load
ln -s -v $DIR_SRC_PLUGIN/memory      $DIR_DEP_PLUGIN/memory
ln -s -v $DIR_SRC_PLUGIN/open_files  $DIR_DEP_PLUGIN/open_files
ln -s -v $DIR_SRC_PLUGIN/open_inodes $DIR_DEP_PLUGIN/open_inodes
ln -s -v $DIR_SRC_PLUGIN/processes   $DIR_DEP_PLUGIN/processes
ln -s -v $DIR_SRC_PLUGIN/proc_pri    $DIR_DEP_PLUGIN/proc_pri
ln -s -v $DIR_SRC_PLUGIN/swap        $DIR_DEP_PLUGIN/swap
ln -s -v $DIR_SRC_PLUGIN/threads     $DIR_DEP_PLUGIN/threads
ln -s -v $DIR_SRC_PLUGIN/uptime      $DIR_DEP_PLUGIN/uptime
ln -s -v $DIR_SRC_PLUGIN/vmstat      $DIR_DEP_PLUGIN/vmstat        
