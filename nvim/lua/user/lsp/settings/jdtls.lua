return {
	settings = {
    java = {
      jdt = {
        ls = {
          vmargs = "-XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xmx2G -Xms256m"
        }
      },
    }
	},
}
