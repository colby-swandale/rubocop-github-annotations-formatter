# frozen_string_literal: true

require_relative "rubocop-github-annotation-formatter/version"
require 'rubocop/formatter/base_formatter'

module RubocopGithubAnnotationFormatter
  class AnnotationFormatter < RuboCop::Formatter::BaseFormatter
    ANNOTATION_TEMPLATE = "\n::error file=%<file>s,line=%<line>d,col=%<col>d :: %<message>s\n"

    def file_finished(file, offenses)
      return if offenses.empty?

      offenses.each do |offense|
        next if offense.corrected?

        output.printf(ANNOTATION_TEMPLATE, file: file,  line: offense.location.line, col: offense.location.begin_pos,
          message: offense.message)
      end
    end
  end
end