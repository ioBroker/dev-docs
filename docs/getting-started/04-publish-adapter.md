# Publishing your adapter

## Check Adapter before publishing

Of course you should check if your adapter is working as expected, before publishing it. But there are also some requirements
that can be automatically tested. You can either do that in the [ioBroker developer portal](https://www.iobroker.dev/adapter-check) (log in with
your GitHub account and it should already list your adapters) or [manually online](https://adapter-check.iobroker.in/) (paste the repository URL there).

Some of the warnings can be ignored, for example if your adapter is not yet on npm or in the repository.

Good resources for solving such errors and warnings can be found in the [best practices](https://github.com/ioBroker/ioBroker.repositories#development-and-coding-best-practices)
and in the [review checklist for entry into the repository](https://github.com/ioBroker/ioBroker.repositories/blob/master/REVIEW_CHECKLIST.md). 

## Publish

It is strongly recommended to use the release script and the `test-and-release` workflow. If you answered the question 
'Do you want to release your adapter with a single comment' in the creator with 'yes', release script should already be
installed and configured. If not, have a look [here](https://github.com/AlCalzone/release-script/blob/master/README.md) 
or in the [sample adapter](https://github.com/ioBroker/ioBroker.example/blob/master/JavaScript/.releaseconfig.json).

### NPM
In order for the workflow to also publish your adapter to npm, you need to add a secret to your repository. Log in to 
[NPM](https://www.npmjs.com/) or create an account (might use your GitHub account for that). You *should* enable 2FA for 
your account.

On the right side, you should see your profile picture. Click on it and select "Access Tokens". Create a new classic token,
enter a name for you to identify it by (for example 'ioBroker' or your adapter name) and select 'Automation' as type (if it
does not show up, you did not yet enable 2FA for the account, then select 'Publish', but maybe first enable 2FA. It really makes
sense!).

Now, *copy the token*. You won't be able to read it again later and have to create a new one.

### Add Secret to GitHub

Go to your repository on GitHub and select "Settings" in the top bar. On the left find "Secrets and variables", select 
"Actions" and click on "New repository secret". Enter the name `NPM_TOKEN` and paste the token you copied from npm. Save.

Check in Settings/Actions/General if the Workflow permissions are set to "read and write permissions". If not, change it and save.

### Enable automatic npm release in workflow file

The last step is to edit the file `.github/workflows/test-and-release.yml` in your adapter. You can do this either with
the online editor at GitHub or with your favorite editor / IDE and pushing to GitHub, just like other files of your adater.

Open the file, scroll down to the line, where it says '# TODO: To enable automatic npm releases, create a token on npmjs.org'.
Remove that line and uncomment the following lines, starting with the line where it says `deploy:`. Since it is a yaml file,
be sure to keep the indentation.
For now, keep the part with sentry commented out.

## Modify changelog

In your `README.md`, at the bottom, there should already be a section 'Work in progress' in the changelog, i.e. 
looking like this:

``` ### **WORK IN PROGRESS** ```

This line is a placeholder for the actual date of the release. Just add what you modified as bullet points ('*') below
that line and the release script will use them as changelog / news and put in the right date. Do this for every release.

## Run release script

After all of the above is done, run the release script:
``` npm run release ```

It will ask you about the type of release or you can already supply that as parameter (`patch`, `minor` or `major`). 
Basically, if you fix something, use `patch`, if you add a new feature, use `minor`, 
if the user needs to change something, use `major`.  See [SemVer](https://semver.org/) for details.

The script will assemble the changelog, translate it and put it into the `io-package.json`, update the version number, in
`io-package.json` and `package.json`, commit the changes, create a git tag and push everything to GitHub. This will trigger
the `deploy` part of the `test-and-release` workflow, so after your adapter passed the (very basic) tests, releases will 
be created on GitHub and npm.

## Trouble shooting

* Error 504 during translation: The translation of longer text snippets fail sometimes. Shorten the text and retry.
* Also be sure that all is committed. There are often uncommitted changes. But the error message is clear here.
* Best practice: run the tests locally or at least commit the latest status and push to GitHub and check that testing works BEFORE creating a new version (else you need to revert a lot of stuff (especially io-package!) because the version then never went out.
* Check your emails/GitHub actions page to see if the release was successfully
