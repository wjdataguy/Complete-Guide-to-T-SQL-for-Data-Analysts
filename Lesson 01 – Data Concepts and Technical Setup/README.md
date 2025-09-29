# Environment Setup Instructions

<b>Overview</b><br>
You need to do all this setup on your own, and there is no support aside from what you can obtain on your own. The good news is that the tools needed for this course can all be downloaded for free.

You will need access to a SQL Server, SQL Server Management Studio, and have the ability to create databases on that SQL Server. For this reason, it is best if you can do the installation on a personal computer. Setup is not that hard, but may take more time if you are using a work machine or a machine with lots of security on it.

This GitHub repository will point you to CURRENT Microsoft resources to help with this.

<b>Step 1 - Install SQL Server</b><br>
I have run this class from end to end using <b>SQL Server 2022 Express</b> which can be downloaded from
https://www.microsoft.com/en-ca/sql-server/sql-server-downloads

I chose to use an on-premise verison of SQL Server as many learners do not want to set-up Azure subscriptions and deal with any potetial cost concerns.

Feel free to use any verison of SQL Server that you choose to, but keep in mind that the database creation scripts may or may not work on that verison. If not, you may need to adjust parts of the scripts that do not work on your own. 

<b>Step 2 - Install SQL Server Management Studio</b><br>
I have run this class from end to end using <b>Server Management Studio 21.x</b>. Download links and installation instructions can be found at:<br>
https://learn.microsoft.com/en-us/ssms/install/install

<b>Step 3 - CREATE BookSellers database</b><br>
With Management Studio open, run the <b>CREATE BookSellers Database.sql</b> script. Watch the course videos for a brief demo of this.

<b>Step 4 - CREATE DemoSets database</b><br>
With Management Studio open, run the <b>CREATE DemoSets Database.sql</b> script. Watch the course videos for a brief demo of this.

<b>Step 5 - Install AdventureWorks</b><br>
Download links and installation instructions can be found at:<br>
https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure
