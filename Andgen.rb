module Helper
  def colorize(text, color = "default", bgColor = "default")
    colors = {"default" => "38", "black" => "30", "red" => "31", "green" => "32", "brown" => "33", "blue" => "34", "purple" => "35",
              "cyan" => "36", "gray" => "37", "dark gray" => "1;30", "light red" => "1;31", "light green" => "1;32", "yellow" => "1;33",
              "light blue" => "1;34", "light purple" => "1;35", "light cyan" => "1;36", "white" => "1;37"}
    bgColors = {"default" => "0", "black" => "40", "red" => "41", "green" => "42", "brown" => "43", "blue" => "44",
                "purple" => "45", "cyan" => "46", "gray" => "47", "dark gray" => "100", "light red" => "101", "light green" => "102",
                "yellow" => "103", "light blue" => "104", "light purple" => "105", "light cyan" => "106", "white" => "107"}
    color_code = colors[color]
    bgColor_code = bgColors[bgColor]
    "\033[#{bgColor_code};#{color_code}m#{text}\033[0m"
  end

  def error message
    puts "#{colorize("  Error ", "red")}: "+message
  end

  def green message
    "#{colorize(message, "green")}"
  end

  def yellow message
    "#{colorize(message, "yellow")}"
  end

  def arg_is_zero
    ARGV.length == 0
  end

  def arg_is_one
    ARGV.length == 1
  end

  def arg_is_two
    ARGV.length == 2
  end

  def default_message
    puts 'Use --help for available android generators'
  end

  def created file
    puts "#{colorize("  Created   ", "yellow")}"+file
  end

  def process_single_arg
    case ARGV[0].to_s.downcase
      when '--help'
        puts yellow "Android Generators"
        puts yellow("  Command          ")+ "|" + yellow("   Arguments       ")
        puts '  ------------------------------------------------------------------'
        puts '  Activity         |   [ActivityName] '
        puts '  Fragment         |   [FragmentName] '
        puts '  Layout           |   [layout_name] '
        puts '  ------------------------------------------------------------------'
        puts
        puts yellow "Mosby Generators"
        puts yellow("  Command          ")+ "|" + yellow("   Arguments       ")
        puts '  ------------------------------------------------------------------'
        puts '  MvpActivity      |   [ActivityName] '
        puts '  MvpLceActivity   |   [ActivityName] [ContentView] [Model] '
        puts '  MvpFragment      |   [FragmentName] '
        puts '  MvpLceFragment   |   [FragmentName] [ContentView] [Model] '
        puts '  ------------------------------------------------------------------'
        puts
        puts yellow "Conductor Generators"
        puts yellow("  Command          ")+ "|" + yellow("   Arguments       ")
        puts '  ------------------------------------------------------------------'
        puts '  Conductor        |   [ConductorName] '
        puts '  MvpConductor     |   [ConductorName] '
        puts '  MvpLceConductor  |   [ConductorName] [ContentView] [Model] '
        puts '  ------------------------------------------------------------------'
        puts
        puts yellow "Optional flags"
        puts yellow("  Flag             ")+ "|" + yellow("   Definition       ")
        puts '  ------------------------------------------------------------------'
        puts '  -l               |   Generates layout file '
        puts '  -bl              |   Generates bindable layout file '
        puts '  ------------------------------------------------------------------'
        puts

        puts 'By default, class file will be generated and placed inside the top-most package'
        return
      when '--version'
        puts 'Andgen v1.0.0'
        return
      when 'activity'
        puts yellow("Example : ") + "andgen Activity MainActivity -l some.package"
        return
      when 'fragment'
        puts yellow("Example : ") + "andgen Fragment MainFragment -l some.package"
        return
      when 'layout'
        puts yellow("Example : ") + "andgen Layout main_layout -bl"
        return
      when 'mvpactivity'
        puts yellow("Example : ") + "andgen MvpActivity MainActivity -l some.package"
        return
      when 'mvplceactivity'
        puts yellow("  Command          ")+ "|" + yellow("   Arguments       ")
        puts '  MvpLceActivity   |   [ActivityName] [ContentView] [Model] '
        puts
        puts yellow("Example : ") + "andgen MvpLceActivity MainActivity RecyclerView List<String> -l some.package"
        return
      when 'mvpfragment'
        return
      when 'mvplcefragment'
        return
      when 'conductor'
        return
      when 'mvpconductor'
        return
      when 'mvplceconductor'
        return
    end
    error 'Incorrect command'
    default_message
  end

end

module ArgumentsChecker

  def arg_layout
    ARGV.each do |arg|
      if arg == '-l'
        return :layout
      elsif arg == '-bl'
        return :bindable_layout
      end
    end
    false
  end

  def arg_command
    accepted_commands = ['activity', 'fragment']
    if arg_is_one
      process_single_arg
      return true
    elsif ARGV.length>1
      command = ARGV[0].to_s.downcase
      if accepted_commands.to_a.include?(command)
        return command
      else
        return false
      end
    end
    false
  end

end

module Generator

  def module_check
    @module_dir = Dir.pwd
    if module_or_not
      return true
    elsif check_for_default_module
      return true
    else
      error 'Make sure you are at module root'
    end
  end

  def module_or_not
    Dir.chdir(@module_dir)
    Dir.glob("*").select { |d|
      if File.basename(d).to_s == 'src'
        return true
      end
    }
    return false
  end

  def check_for_default_module
    Dir.glob("*").select { |d|
      if File.basename(d).to_s == 'app'
        @module_dir = @module_dir + "/" + d
      end
    }
    return module_or_not
  end

end

class LayoutGenerator
  include Generator

  def get_template
    return '<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
              android:orientation="vertical"
              android:layout_width="match_parent"
              android:layout_height="match_parent">

</LinearLayout>'
  end

  def underscore(camel_cased_word)
    camel_cased_word.to_s.gsub(/::/, '/').
        gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
        gsub(/([a-z\d])([A-Z])/, '\1_\2').
        tr("-", "_").
        downcase
  end

  def create_layout_file
    file_name = ARGV[1]
    file_name = underscore file_name
    Dir.glob("**/main/res/**/*").select { |d|
      if d.to_s.end_with? 'layout'
        file = d+'/'+file_name+'.xml'
        File.open(file, 'w') { |file| file.write get_template }

        created file
      end
    }
  end
end

class ActivityGenerator
  include Generator

  def get_template name
    return "import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class #{name} extends AppCompatActivity
{

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
    }

}"
  end

  def package_exists folders_hash
    d = Dir.glob("**/main/java/**/*").select {
        |d|
      if folders_hash.key? (File.basename d)
        folders_hash[File.basename d] = true
        if folders_hash.keys.last.to_s == File.basename(d).to_s
          return d
        end
      end
    }
    return false
  end

  def create_activity package
    if package == :nothing
      d = Dir.glob("**/main/java/**/*").last

      if d.to_s.end_with? '.java'
        file = File.dirname(d)+'/'+ARGV[1]+'.java'
      else
        file = d+'/'+ARGV[1]+'.java'
      end

      if File.file?(file)
        puts error(file +" already exists!")
        return
      end

      File.open(file, 'w') { |file| file.write(get_template(ARGV[1])) }

      created file
    else
      folders = package.to_s.split('.')
      folders_hash = folders.map { |x| [x, false] }.to_h
      #find the first folder
      dir = package_exists folders_hash
      case dir
        when false

        else
          #simply create the Activity inside the package
          file = dir+'/'+ARGV[1]+'.java'
          if File.file?(file)
            puts error(file +" already exists!")
            return
          end

          File.open(file, 'w') { |file| file.write(get_template(ARGV[1])) }

          created file
      end
    end

  end

  def create_layout
    if arg_layout
      LayoutGenerator.new.create_layout_file
      return true
    end
    false
  end

  def verify_args
    if ARGV.length == 2
      create_activity :nothing
    elsif ARGV.length == 3
      unless create_layout
        # the third argument is the package
        create_activity ARGV[2]
      else
        create_activity :nothing
      end

    end
  end

end

include Helper
include ArgumentsChecker

def run_command command
  case command
    when 'activity'
      ActivityGenerator.new.verify_args
    when 'fragment'

    when true
      #ignore : it means that the command was processed so no need to go further with it
    else
      error("Command not found, use --help to see available commands.")
  end
end

run_command arg_command