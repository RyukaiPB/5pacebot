def loadyield(dir)
    dire = Dir.glob("#{dir}/*.rb")
    dire.each do |x|
        puts "Loading #{dir}: #{x}"
        load x
        yield
    end
end

def loaddir(dir)
    loadyield(dir) {}
end

def loadcore()
    loaddir "core"
end
