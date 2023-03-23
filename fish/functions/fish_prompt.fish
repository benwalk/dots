# ------------------------------------------------------------------------------
# Custom, slimmer version of rafaelrinaldi/pure, plus personal goodies.
# ------------------------------------------------------------------------------
function fish_prompt

  function string_width \
      --description 'returns raw string length, i.e. ignore ANSI-color' \
      --argument-names str

      set --local empty ''
      set --local raw_prompt (string replace --all --regex '\e\[[^m]*m' $empty -- $str)

      string length -- $raw_prompt
  end

  function prompt_part_command_duration \
      --description 'Prints duration of previous command if > 5s.'
      set --local command_duration

      if test -n "$CMD_DURATION"
        and test $CMD_DURATION -gt 5000
          set command_duration (format_millis $CMD_DURATION)
      end
      set --local command_duration_color (set_color yellow)

      echo "$command_duration_color$command_duration"
  end

  function prompt_part_aws_vault \
      --description 'Prints AWS VAULT profile.'

      if test -n "$AWS_VAULT"
          set --local aws_profile $AWS_VAULT
          set --local aws_color (set_color yellow)

          echo "$aws_color$aws_profile"
      end
  end

  function prompt_part_virtualenv \
      --description 'Prints Python virtualenv directory.'

      if test -n "$VIRTUAL_ENV"
          set --local virtualenv (basename "$VIRTUAL_ENV")
          set --local virtualenv_color (set_color brblue)

          echo "$virtualenv_color$virtualenv"
      end
  end

  function prompt_part_symbol \
      --description 'Print prompt symbol' \
      --argument-names exit_code

      set --local symbol $fish_prompt_symbol
      #set --local symbol_color_success (set_color $pure_color_prompt_on_success)
      #set --local symbol_color_error (set_color $pure_color_prompt_on_error)
      #set --local command_succeed 0
      #set --local symbol_color $symbol_color_success # default pure symbol color
      set --local symbol_color (set_color blue)

      #if test $exit_code -ne $command_succeed
      #    set symbol_color $symbol_color_error # different pure symbol color when previous command failed
      #
      #    if test "$pure_separate_prompt_on_error" = true
      #        set symbol_color "$symbol_color_error$symbol$symbol_color_success"
      #    end
      #end
      iterm2_prompt_mark
      echo "$symbol_color$symbol"
  end

  function prompt_print_parts \
      --description 'Prints a series of parts for a prompt line.'

      set --local prompt
      for prompt_part in $argv
          if test (string_width $prompt_part) -gt 0
              set prompt "$prompt $prompt_part"
          end
      end

      echo (string trim -l $prompt)
  end

#-------------------------------------------------------------------------------
  function prompt_clear_line \
      --description 'Clear existing line content before prompt.'

      set --local clear_line "\r\033[K"
      echo $clear_line
  end

  function prompt_first_line \
      --description 'Print contextual information (Duration) before prompt.'

      # parts (just one for now)
      set --local duration (prompt_part_command_duration)

      # print parts
      echo (prompt_print_parts $duration)
  end

  function prompt_main_line \
      --description 'Print context and symbol.'

      set --local aws_vault (prompt_part_aws_vault)
      set --local virtualenv (prompt_part_virtualenv) # Python virtualenv name
      set --local symbol (prompt_part_symbol $exit_code)
      set --local reset_color (set_color normal)

      echo (prompt_print_parts $aws_vault $virtualenv $symbol $reset_color)
  end

#-------------------------------------------------------------------------------
    set --local exit_code $status  # save previous exit code

    echo -e -n (prompt_clear_line)
    echo -e (prompt_first_line)
    echo -e -n (prompt_main_line)
end
