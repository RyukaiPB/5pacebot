def mainloop
    while true
        ready = select([@irc, $stdin],nil,nil,nil)
        next if !ready

        for s in ready[0]
            if s == $stdin then
                return if $stdin.eof
                s = $stdin.gets
                @irc.send "${s}\n",0
            elsif s == @irc then
                return if @irc.eof
                s = @irc.gets
                puts "< #{s}"

                runplugins s
            end
        end
    end
end
