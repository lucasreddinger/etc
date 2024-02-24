# [solution to "want to send button value with event-triggered submit"](https://stackoverflow.com/questions/77945140/want-to-send-button-value-with-event-triggered-submit/77952559#77952559)

The submit button name/value pair will only be included in the form data if the form is submitted via clicking that submit button.

Accordingly you need to store that form data elsewhere. Simply convert the two buttons to radio inputs. Now your code is shorter, because you don't need to preventDefault of the form submission! [See this](https://html-preview.github.io/?url=https://github.com/lucasreddinger/etc/blob/master/misc/jquery-delay_submit/mwe.html).

You can use Bootstrap to easily make those radio inputs look like buttons. [See this](https://html-preview.github.io/?url=https://github.com/lucasreddinger/etc/blob/master/misc/jquery-delay_submit/index.html).
