class ColourOutput
    
    # terminal output colours
    @@colours = {
        primary: "\033[95m",
        blue: "\033[94m",
        green: "\033[92m",
        warning: "\033[93m",
    }

    # print out a random color
    def ColourOutput.random string
        random_key = @@colours.keys.sample

        self.send(random_key, string)
    end

    # if the method is missing we need to wrap the argument in a 
    # color from the method call
    def ColourOutput.method_missing name, *args

        if @@colours.include? name
            "#{@@colours[name]}#{args[0]}\033[0m"
        else
            "\033[92m#{args[0]}\033[0m"
        end
    end
end