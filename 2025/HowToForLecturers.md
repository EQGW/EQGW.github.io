
# Evolutionary Quantitative Genetics Workshop #

|        |        |        |    |
|--------|---------------------------------------------|--------------------|------------------------------------------|
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [2025 Workshop](/index.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [SCHEDULE](/2025/schedule.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [RESOURCES](/2025/resources.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [PREVIOUS YEARS](/2025/previous.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |


<div align="left">
<img src="/media/SWVirginiaMtns.jpg" alt="[Southwest Virginia mountains]">
</div>


# For workshop lecturers: editing lecture and exercise pages and posting files #

The lecturers in the workshop have been given access to the Github account of the Workshop, to enable them to add pages to the site, or to edit pages on the site, or to post files and make links to them. They should start each such session by logging into the site github.com/EQGW/ using their own Github username and the password that they established for their own Github account.  Make sure, if it is available, to look on the right-hand center of the page to see whether there is a button allowing you to choose whether to be regarded as a member of the Public or as a Member.  You should choose Member.




## Adding a new lecture or exercise web page ##

We will create pages for all the lectures, and as we add computer labs, we will try to create pages in a timely way.

These instructions show how to do it if we did not make such a page.  If I did make one, simply find the page in this year's folder on the EQGW Github site
and skip this section and go to the one below, about how to edit an existing page.

If we do not already have a page for the lecture, figure out what its name will be.  You can figure 
out what it is by noting which day of the workshop it is on, and which lecture.  If it is the 2nd 
lecture on the 3rd day of the workshop, its name will be &nbsp; lecture3-2.md  &nbsp; It will be in the 
folder for that year, so in the 2022 Workshop it will be file &nbsp; 2022/lecture3-2.md

The ".md" indicates
a page in the Github Markdown language, an allegedly simple system for entering text and links, and
doing highlighting such as making italic text, bold text, links, or simple tables.  _However:_ fancier
formatting will plunge you into the Depths Of Despair, otherwise known as HTML style sheets.

When the webpages at the site are served up, the ".md" pages are processed and ".html" pages are
made, and it is these that the user sees.  So links to other webpages at the site should be to
the ".html" version of the name.  So you may edit the page &nbsp; lecture3-2.md &nbsp; but the final product 
that the user sees will be called &nbsp; lecture3-2.html

If when you go to find the pages, you do not 
see the folder for the year, you might see a link called "Code" which will make it visible.

1.  Look in the year folder, and in any folders within that, and verify that there is no file of that name.  If there is such a file,
skip this section of these instructions and go to the next section, which tells how to edit the file.
2.  If there is no file for the lecture, start out by clicking on the filename of some other lecture ".md" file
3.  It will be brought up in edit mode.  Copy all the contents of that file.  Do not change anything in that file or a fellow lecturer, whose lecture that is, will get upset with you.
4.  Now go to the filename above in the page and click on the year.  The list of existing pages will appear, in their ".md" forms.
5.  Above them and to the right you will also see a button that says "Add file".  Choose it.  
6.  From the drop-down menu that appears, choose "Create new file".  This should open the file for editing.  You will see a 
line number (1) on the first line, at the left side of the editing area.  Above that area you will see that there is a path for the name of the file, but with the final part of the name empty, represented by a box.  Type the filename into that box.  For example, if the lecture is  lecture3-2, type in "lecture3-2.md" (without the quotes).
7. Go to the text immediately after line 1, put your cursor there and paste in all the contents of that other webpage.
8. Of course some of it is different from what you want, so set to work editing it.  Make sure to note the markdown code that makes the links to the previous and the next lectures, and correct those.  Also, of course, correct the heading that announces the number of the lecture.   One subtle point of Markdown syntax is that if you are highlighting text, or changing headers, _make sure you understand whether there should be a blank before or after the text being highlighted_. (Generally, yes for headers, no for text). 
9. To figure out Markdown syntax, open a new window on your desktop and in it search for "Github Markdown" and look at some set of easy instructions.
10. You can see roughly what the page will look like by clicking on the eyeball named "Preview" which is to the right of "Edit file", at the top of the editing area.
11. **_But_** whatever you do, when you are ready to go elsewhere, _don't_ until you go down to the green button that asks you to "Commit" your content, and press that confidently enough that it changes color, showing that you weren't too timid.  Otherwise, of course, you will lose everything you did when you leave.
12. Github will show you what the page will look like based on what you committed.  If that has problems, find the small pencil icon above this preview and to the right, and use it to reopen editing.  Any further changes you make of course need to be saved using Commit.

You probably want to link to PDF or PPT files of slides, to files of R exercises, and other media.  Do <em>not put them in our Github repository</em>, but instead post those files to the appropriate folder for Google Drive for the fhleqg Gmail account.  Use the instructions below for “posting files to be linked to from the web page” and also the instructions below that for obtaining the link for each such file to make a link from the web page that you are creating in this list of instructions.
You may also want to go to the Schedule page and create a new line for the new page, with a link to it.  Be careful if you do that, as we all rely on the schedule page.  So if you fuck up the schedule page, make sure you have a plausible story about how it is someone else's fault. 


## Editing an existing web page on the Github site ##

Once there is a web page for a lecture or exercise for this year, you may want to edit it further.  Here is how.  This repeats some of the instructions given above.

1. Click on the year.  This will bring up a folder with files for all the lectures.
2. The list of existing pages will appear, in their ".md" forms.
3. Click on the name of the file you want to edit.
4. That file will be brought up.
5. Put it in edit mode by clicking on the little pencil icon which is above and to the right.
6. Some of it is different from what you want, so set to work editing it.  Make sure to note the markdown code that makes the links to the previous and the next lectures, and correct those.  Also, of course, correct the heading that announces the number of the lecture.   One subtle point of Markdown syntax is that if you are highlighting text, or changing headers, _make sure you understand whether there should be a blank before or after the text being highlighted_. (Generally, yes for headers, no for text). 
7. To figure out Markdown syntax, open a new window on your desktop and in it search for "Github Markdown" and look at some set of easy instructions.
8. You can see roughly what the page will look like by clicking on the eyeball named "Preview" which is to the right of "Edit file", at the top of the editing area.
9. **_But_** whatever you do, when you are ready to go elsewhere, _don't_ until you go down to the green button that asks you to "Commit changes", and press that confidently enough that it changes color, showing that you weren't too timid.  Otherwise, of course, when you leave you will lose everything you changed.
10. In the Preview mode, Github will show you what the page will look like based on what you committed.  If that has problems, find the small pencil icon above this preview, and to the right, and use it to reopen editing.  Any further changes you make of course need to be saved using Commit.

You probably want to link to PDF or PPT files of slides, to files of R exercises, and other media.  Put these files into our Github repository, in the folder named for the lecture or exercise.

Note that your changes will appear in the workshop web pages, but only after a delay of perhaps 15 minutes.

