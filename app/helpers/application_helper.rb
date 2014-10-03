module ApplicationHelper

  def typekit_include_tag apikey
    javascript_include_tag("//use.typekit.net/znt3iba.js") +
    javascript_tag("try{Typekit.load()}catch(e){}")
  end

end
