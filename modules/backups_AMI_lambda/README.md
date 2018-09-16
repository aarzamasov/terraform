tags:
The backup for ec2 instances was set.

The time for  backup is every day at 01:20 AM UTC.
Backup was set for two ec2 instances: Production and Stage.

For  backup of new ec2 instance  add  four tags to the desirable instance 

AutoDigiBackup: yes. This marks the instances that need to be backed up. 
AutoDigiBackupRetentionDays: from 1 to as many days as you want the backup to be stored. 
AutoDigiBackupSchedule: * (for every day) or a mix of number from 0 (Sunday), 1 (Monday) and all the way to 6 (Saturday). You can set value to say 012 which means run on Sunday, Monday and Tuesday. You can set just 6 to run only on Saturday.
AutoDigiNoReboot: true if you want to prevent reboot the ec2 during the backup



module "backup-lambda-ami" {
  source              = "../../../tf-modules/backups_AMI_lambda"
  aws_region          = "us-east-1"
}