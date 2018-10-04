## Git Commit Style Guide

## General Guidance

Avoid committing straight to master, use branches and Merge Requests instead. Committing to master should only be done if you have really good reason as it hides the change from everyone else. Opening a Merge Request and merging it yourself is always an option.

Rebasing is expected on feature branches, but we don't rebase master unless we have extremely good reason and we've talked about it as a team.

## Branch Naming

Branches should be named using descriptive english that gives an indication of what's contained. Examples

* Good: ops-upgrade-powershell
* Less good: powershell
* Good: remove-activeadmin-features
* Less good: remove-test-stuff
* Good: stop-using-an-unknown-cloudfront-host
* Less good: fix-cloudfront

## What to aim for in your commits

A good commit is an atomic set of connected changes. When applied, a single commit should:

* Leave the project in a consistent state, ideally with all the tests passing
* Not include extraneous changes - typos or some tiny refactoring that you happened to make but which isn't directly related

By breaking up changes into atomic commits:

* We help make it clear what our intent was because the diff is as small as possible, and there's less to cram in to a commit message.
* It's easier for others to learn from and to review
if someone needs to repeat what you've done in the future, they can do so easily
* Similarly, someone who needs to tweak or undo what you've done

## Commit messages

Writing good commit messages is important. Not just for yourself, but for other engineers on your project. This includes:

* New (or recently absent) engineers who want to get up to speed
* Any future engineers (including yourself) who want to see why a change was made

### Content

A good commit message briefly summarises the "what" for scanning purposes, but also includes the "why". If the "what" in the message isn't enough, the diff is there as a fallback. This isn't true for the "why" of a change - this can be much harder or impossible to reconstruct, but is often really important.

**Example**

Instead of:

    Set cache headers

prefer:

    Set cache headers

    IE 6 was doing foo, so we need to do X.
    See http://example.com/why-is-this-broken for more details.

## Links to issue trackers

A link to a ticket in an issue tracker isn't an alternative to writing a commit message. Write a good and complete commit message and, if you want to, link to the issue tracker as an added extra.

While a link can add some extra context for people reviewing a pull request, there's no guarantee that the link will be accessible to that person nor that it will continue to work at all in the future.

## Structure

Commit messages should start with a one-line summary no longer than 50 characters. Various Git tools use this as the commit summary, so you should format it like an email subject, with a leading capital and no full stop. The Git convention is to write these in the present tense.

You should leave a blank line before the rest of the commit message, which you should wrap at around 72 characters: this makes it easier to view commit messages in a terminal.



