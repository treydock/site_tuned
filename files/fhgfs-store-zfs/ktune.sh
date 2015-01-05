#!/bin/sh

. /etc/tune-profiles/functions

start() {
	set_cpu_governor performance
	set_transparent_hugepages never
    # Now give the IO scheduler more flexibility by increasing the number of schedulable requests
	multiply_disk_readahead 32
        # To improve throughput for sequential reads, increase the maximum amount of read-ahead data.
        # The actual amount of read-ahead is adaptive,
        # so using a high value here won't harm performance for small random access.
        for i in /sys/block/sd?/queue/nr_requests; 
        do 
                echo 4096 > $i; 
        done

	return 0
}

stop() {
	restore_cpu_governor
	restore_transparent_hugepages
	restore_disk_readahead
        for i in /sys/block/sd?/queue/nr_requests; 
        do 
                echo 128 > $i; 
        done

	return 0
}

process $@
