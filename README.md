# National-Park-Weather-App
This is a Weather Application written in Java using Spring MVC. Gives park info and a five-day forecast for selected 
national parks.  

TO-DO LIST:
- Give feedback when no email is present/error message
- Put things in flash attributes to hide and redirect (JSP has access to it without the need to add in controller)
- Keep selected fields selected on failed submit
- Change Weather POJO getter for temps to getLowFar and get LowCel
- Move session temp scale set to park detail controller
- Add toLowercase to park object rather than in the JSP
- Weather object add forecast filename to strip spaces out
- On temperature options use “selected” instead of flipping html around
- Add flash attributes selected to survey forEach  
