require "test_helper"

class RubocopGithubAnnotationFormatterTest < Minitest::Test
  def setup
    @output = StringIO.new
    @formatter = RubocopGithubAnnotationFormatter::AnnotationFormatter.new(@output)
  end

  def offense_with_severity(severity, message: "Example cop message", line: 1, status: :uncorrected)
    source_buffer = Parser::Source::Buffer.new("test.rb", line)
    source_buffer.source = "puts 'Hello World'\n"
    range = Parser::Source::Range.new(source_buffer, 0, 1)

    RuboCop::Cop::Offense.new(severity, range, message, "CopName", status)
  end

  def test_no_offences
    @formatter.file_finished("test-file.rb", [])
    assert_equal @output.string, ""
  end

  def test_warning_output
    @formatter.file_finished("test.rb", [offense_with_severity(:warning)])
    assert_equal @output.string, "\n::warning file=test.rb,line=1,col=0 :: Example cop message\n"
  end

  def test_error_output
    @formatter.file_finished("test.rb", [offense_with_severity(:error)])
    assert_equal @output.string, "\n::error file=test.rb,line=1,col=0 :: Example cop message\n"
  end

  def test_info_output
    @formatter.file_finished("test.rb", [offense_with_severity(:convention)])
    assert_equal @output.string, "\n::info file=test.rb,line=1,col=0 :: Example cop message\n"
  end

  def test_multiple_warning_output
    @formatter.file_finished("test1.rb", [
      offense_with_severity(:warning),
      offense_with_severity(:error, message: "Example cop message 2", line: 2)
    ])

    assert_equal @output.string, <<~OUTPUT
      
      ::warning file=test1.rb,line=1,col=0 :: Example cop message

      ::error file=test1.rb,line=2,col=0 :: Example cop message 2
    OUTPUT
  end

  def test_corrected_cop
    @formatter.file_finished("test.rb", [offense_with_severity(:warning, status: :corrected)])
    assert_equal @output.string, ""
  end
end
