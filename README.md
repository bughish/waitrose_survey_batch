waitrose_survey_batch
=====================

www.waitrosecares.com - survey helper, having array of batch receipts and userdata as input
Will complete number of survey cycles for the user based on the number of receipts in array.

Pre-requisites: make sure you have Ruby 1.9.3 installed and watir-webdriver gem.

#Instructions
1. Fork repo and copy to local.
2. Add receipts to waitrose_receipts.txt, each from new line.
3. Add your data (including name, address, email, etc) to waitrose_userdata.txt
4. In waitrose_survey_batch.rb uncomment lines 166-174 by removing # in fron of each line. (in order to have the requests sent at last step).
4. run "ruby waitrose_survey_batch.rb"
