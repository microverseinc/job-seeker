# Job Seeker

A Ruby script and Rake file that finds new available remote jobs and sends an email digest.

## How does it work?

* It uses the RSS feeds and APIs of multiple remote job sources to find availabl jobs (e.g. remoteok.io)
* It aggregates all jobs posted in the last 24 hours
* It filters the jobs based on certain keywords (e.g. `rails`)
* There is a Rakefile that sends an email with a digest of all the jobs found
* The Rakefile is run by Heroku's Scheduler once a day

## How to join the mail list?

* [Click here](https://groups.google.com/a/microverse.org/forum/#!forum/jobseekers) to join the Microverse's Job Seeker mail list
* You will receive a daily email with the jobs digest

## About Microverse
[Microverse](https://www.microverse.org/) is a school for remote software developers that is completely free until you find a job. 
We look for really talented people all around the world and we train them for 6-12 months.
If you want to join, you can apply [here](https://www.microverse.org/).

## Maintainers

- [@arielcamus](https://github.com/arielcamus)
- [@Keqi](https://github.com/Keqi)
