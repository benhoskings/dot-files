require "irb/completion"
require 'irb/ext/save-history'

ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history" 
IRB.conf[:PROMPT_MODE] = :SIMPLE

