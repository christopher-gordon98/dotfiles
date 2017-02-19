#!/usr/bin/env bash


function prompt_command() {
  SCM_THEME_PROMPT_DIRTY="${yellow}[✷]${reset_color}"
  SCM_THEME_PROMPT_CLEAN=" ${bold_green}(⦿)${reset_color}"

  SCM_THEME_PROMPT_PREFIX="${reset_color}|${green}"
  SCM_THEME_PROMPT_SUFFIX="${reset_color}|"

  GIT_THEME_PROMPT_PREFIX="${reset_color}|${bold_green}"
  GIT_THEME_PROMPT_SUFFIX="${reset_color}|"

  PS1="${blue}(⦿)${reset_color}[\h]-[\W]${bold_cyan} $(scm_char) ${green}$(scm_prompt_info) ${green}➜ ${reset_color} "
}

# safe_append_prompt_command prompt_command
