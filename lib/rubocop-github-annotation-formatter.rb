# frozen_string_literal: true

require_relative "rubocop-github-annotation-formatter/version"
require 'rubocop/formatter/base_formatter'

module RubocopGithubAnnotationFormatter
  class AnnotationFormatter < RuboCop::Formatter::BaseFormatter
    ANNOTATION_TEMPLATE = "::%<level>s file=%<file>s,line=%<line>d,col=%<col>d :: %<message>s\n"

    def file_finished(file, offenses)
      return if offenses.empty?

      offenses.each do |offense|
        next if offense.corrected?

        output.printf(ANNOTATION_TEMPLATE, level: level_for_offense(offense), file: file, 
          line: offense.location.line, col: offense.location.begin_pos, message: offense.message)
      end
    end

    def level_for_offense(offense)
      case offense.severity.name
      when :refactor, :convention
        "info"
      when :warning
        "warning"
      when :error, :fatal
        "error"
      else
        raise "Cop severity not found : #{offense.severity.inspect}"
      end
    end
  end
end