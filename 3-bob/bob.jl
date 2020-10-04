function bob(stimulus)
  stimulus = strip(stimulus) 
  responses = Dict(
    :question => "Sure.",
    :yelling => "Whoa, chill out!",
    :silence => "Fine. Be that way!",
    :misc => "Whatever.",
    :custom => "Calm down, I know what I'm doing!"
  )
  yell = match(r"^[A-Z,\s]+\?$", stimulus)
  only_numbers = match(r"^[0-9,\,\s]+$", stimulus)
  if yell === nothing
    response = endswith(stimulus, "?") ? "question" : ( !isempty(stimulus) && uppercase(stimulus) == stimulus && only_numbers === nothing ) ? "yelling" : isempty(stimulus) ? "silence" : "misc"
  else
    response = "custom"
  end
  return responses[Symbol(response)]
end
