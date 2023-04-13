# Task 6: Infrastructure as a Code (IaaC)
1. Create <a href="https://github.com/latalaj/cloud_challenge/blob/main/task_6/main.tf">main.tf file</a>, configure the provider and add configuration to create resources:
- Cloud Storage bucket that has public access configured<br>
- Compute Instance<br>
- Cloud SQL instance with Postgres engine. Create database called dareit and a user called dareit_user<br>
2. Manually change the password of the dareit_user<br>
3. Upload manually the index.html file (that you previously created in Task 1) into the newly created bucket.<br>
4. Create a new folder in your cloud_challenge repo with name task_6 , commit the main.tf file there. (don’t commit your terraform state file). Copy the URL of the object (index.htm) from your bucket and add it to readme.md.<br><br>


Static page hosted on Cloud Storage bucket with public access configured: https://storage.googleapis.com/dareit-task6-tf/index.html


