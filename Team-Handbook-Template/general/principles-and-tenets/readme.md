## What/Who is the DevOps Team?

* The DevOps Team is a core group of individuals who have a wide array of skill sets. These skill sets range
from operations, networking, hardware, distributed systems, monitoring, stability, capacity planning, etc.

* DevOps Engineers are responsible for building out and scaling all aspects of infrastructure for any team looking for support.

* DevOps is not just about the technology. DevOps is a mindset, thought process, and cultural shift. These are
traits that seasoned individuals will bring to the organization to help drive it forward.

## Principles and Tenets

1. Know the Service Level
1. Embrace Risk
1. Eliminate Toil
1. Know What’s Broken & Why
1. Stuff Happens
1. Automate [Almost] Everything
1. Reliable Releases
1. Keep It Simple	

## 1. Know the Service Level

* Indicators (SLI): a carefully defined quantitative measure of some aspect of the level of service that is provided
Examples include availability,  request latency, error rate and system throughput.
Be wary of using the mean (average) of a set of metrics collected over some period of time, since outliers are often hidden.
Percentiles usually provide much better metric aggregations.
No more than a handful. Not every metric makes a good SLI

* Objectives (SLO): a target value or range of values for a service level that is measured by an SLI

* Agreements (SLA): an explicit or implicit contract with your users that includes consequences of meeting (or missing) the SLOs they contain  

## 2. Embrace Risk

* Goal is to explicitly align the risk taken by a given service with the risk the business is willing to bear
Strive to make a service reliable enough, but no more reliable than it needs to be.

### Embrace Risk: Error Budgets

* Error Budgets balance the goals of
Product development teams, which are largely evaluated on product velocity, which creates an incentive to push new code as quickly as possible; and
DevOps Engineering Teams, which are evaluated based upon reliability of a service, which implies an incentive to push back against a high rate of change

* A service’s error budget is 100% minus the SLO (e.g. 100 – 99.95% = 0.5%)
  * In general, for any software service or system, 100% is not the right reliability target because no user can tell the difference between a system being 100% available and 99.999% available
  * The DevOps Teams goal is no longer “zero outages”; rather DevOps Engineers and product developers aim to spend the error budget getting maximum feature velocity
  * An outage is no longer a “bad” thing – it is an expected part of the process of innovation, and an occurrence that both development and DevOps Teams manage rather than fear.

* Whenever a service exceeds their error budget, ALL WORK MUST be related to improving availability.

## 3. Eliminate Toil

* In the DevOps Team, we want to spend time on long-term engineering project work instead of operational work.
Because the term operational work may be misinterpreted, we use a specific word: toil
DevOps Engineers should spend less than 20% of their time on toil and rest on work of value

* Toil is mundane, repetitive operational work providing no enduring value, which scales linearly with service growth

* The work of reducing toil and scaling up services is the “Engineering” in DevOps

## 4. Know What’s Broken and Why

* If you can’t monitor a service, then you don’t know what’s happening, and if you’re blind to what’s happening, then you can’t be reliable.
* Monitoring a complex application is a significant engineering endeavour in and of itself
* Monitoring should answer the questions:
  * What’s wrong?
  * Why is it wrong?

* Use the right output:
  * **Alerts:** Signify that a human needs to take action immediately to something that is either happening or about to happen
  * **Tickets:** Signify that a human needs to take action, but not immediately
  * **Logging:** No one needs to look at this information, but it is recorded for diagnostic or forensic purposes 

* Metrics that are useful for overall system operation, but do not influence major user interactions, are not usually SLI’s
For Example, disk space metrics are not usually web UI application indicators.

## 5. Stuff Happens, So Reduce Repair Time

* Reliability is a function of mean time to failure (MTTF) and mean time to repair (MTTR)
  * The most relevant metric is evaluating the effectiveness of emergency response is how quickly the response team can bring the system back to health – that is, the MTTR

* Humans add latency
  * Even if a given system experiences more actual failures, a system that can avoid emergencies that require human intervention will have higher availability than a system that requires hands-on intervention

## 6. Automate [Almost] Everything

* Automation provides
  * Consistency as systems scale
  * A platform for extending to other systems
  * Faster repairs for common problems
  * Faster action than humans
  * Time saving by decoupling operator from operation

* But its not a panacea
  * It can hide systemic problems
    * For example, auto-restarting a process periodically can hide memory leaks
  * It can perform the wrong, or even a damaging , operation because of a poor design or implementation

## 7. Reliable Releases

* Running reliable services requires reliable release processes.

* Continuously build and deploy, including
  * Automating check gates
  * A/B deployments and other methods for sanity checking

* As a DevOps Engineer, don’t be afraid to roll-back a problem release.

* Use engineering principles to manage configuration, including
  * Treating configuration as code, with
  * Version control
  * Reviews and checks
  * Testing
  * Change management

* Automating configuration “deployment”

## 8. Keep It Simple

* Types of complexity:
  * Essential complexity is the complexity inherent in a given solution that cannot be removed from a problem definition
  * Accidental complexity is more fluid and can be resolved with engineering effort

* DevOps Engineers minimise accidental complexity
  * They push back when its introduced into systems
  * They constantly strive to eliminate complexity in systems they on-board and for which they assume operational responsibility



