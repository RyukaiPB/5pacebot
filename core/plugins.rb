def loadplugins
    @hooks = Hash.new(0)
    loadyield "plugins" do
        gethooks.each_pair do |y,z|
            @hooks[y] = z
        end
    end
end

def runplugins(raw)
    @hooks.each_key do |hook|
        if raw =~ hook then
            send @hooks[hook],raw
        end
    end
end
