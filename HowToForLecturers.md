
# Evolutionary Quantitative Genetics Workshop #

|        |        |        |    |
|--------|---------------------------------------------|--------------------|------------------------------------------|
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [2021 Workshop (Online)](/index.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [SCHEDULE](/2021/schedule.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Resources](/2021/resources.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [PREVIOUS YEARS](https://blogs.uw.edu/fhleqg/previous-years) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |


<div align="left">
<img src="/media/FHLimage2018b.jpg" alt="FHL waterfront in 2018">
</div>


# For workshop lecturers: editing lecture and exercise pages and posting files #

The lecturers in the workshop have been given access to the Github account of the Workshop, to enable them to add pages to the site, or to edit pages on the site, or to post files and make links to them. They should start each such session by logging into the site github.com/EQGW/ using their own Github username and the password that they established for their own Github account.


 

## Adding a new lecture or exercise web page ##

I will create pages for all the lectures, and as we add computer labs, I will try to create pages in a timely way.

These instructions show how to do it if I did not make such a page.  If I did make one, simply find the page in this year's folder on the EQGW Github site
and skip this section and go to the one below, about how to edit an existing page.

If we do not already have a page for the lecture, figure out what its name will be.  You can figure 
out what it is by noting which day of the workshop it is on, and which lecture.  If it is the 2nd 
lecture on the 3rd day of the workshop, its name will be &nbsp; lecture3-2.md  &nbsp; It will be in the 
folder for that year, so in the 2021 Workshop it will be file &nbsp; 2021/lecture3-2.md

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

1.  Look in the year folder, and verify that there is no file of that name.  If there is such a file,
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
4. That file will be brought up in edit mode.
5. Some of it is different from what you want, so set to work editing it.  Make sure to note the markdown code that makes the links to the previous and the next lectures, and correct those.  Also, of course, correct the heading that announces the number of the lecture.   One subtle point of Markdown syntax is that if you are highlighting text, or changing headers, _make sure you understand whether there should be a blank before or after the text being highlighted_. (Generally, yes for headers, no for text). 
6. To figure out Markdown syntax, open a new window on your desktop and in it search for "Github Markdown" and look at some set of easy instructions.
7. You can see roughly what the page will look like by clicking on the eyeball named "Preview" which is to the right of "Edit file", at the top of the editing area.
8. **_But_** whatever you do, when you are ready to go elsewhere, _don't_ until you go down to the green button that asks you to "Commit changes", and press that confidently enough that it changes color, showing that you weren't too timid.  Otherwise, of course, you will lose everything you changed when you leave.
9. Github will show you what the page will look like based on what you committed.  If that has problems, find the small pencil icon above this preview, and to the right, and use it to reopen editing.  Any further changes you make of course need to be saved using Commit.

You probably want to link to PDF or PPT files of slides, to files of R exercises, and other media.  Do <em>not put these files into our Github repository</em>, but instead post those files to the appropriate folder for Google Drive for the fhleqg Gmail account.  Use the instructions below for “posting files to be linked to from the web page” and also the instructions below that for obtaining the link for each such file to make a link from the web page that you are creating in this list of instructions.
 

## Posting files at Google Drive to be linked to from the EQGW Github webpage ##

Files such as lecture projections (PPT or PDF), or supplementary documents, or R exercises, or audio recordings, are not to be posted in the workshop Github repository.  Instead, you need to put them in the Google Drive area for the  fhleqg  account, which is a gmail account (a Google account).  If you are a lecturer in the Workshop you have been added, under one of your email addresses, to the list of people who can put files into the Google Drive folder for this year's workshop (it has a folder name which is the year number, such as "2021").  To put such a file there:

1. Go to your Google Drive account and log in, with the username of yours that we gave permission to share folders with the  fhleqg@gmail.com  Google account.
2. After you have chosen the Google Drive icon, on the left side of the window you will find a menu item "Shared with me".
3. Select it.  A list of folders or files that have been recently shared with you will appear.
4. Find the one with the year number for EQGW, such as "2021".
5. Select it.  A set of folders should appear with names such as "lecture3-2".
6. Find the one for your lecture and open it.  If none appears, choose New Folder and make one.
7. Now an area will appear in which you can drag-and-drop any files that you want to store there.
8. Put the files you want to store there.
9. You can change its name once it is there, if you want.

 

## Getting the link for one of those files ##

There is still the matter of getting the address of the file, and posting a link to it on the appropriate lecture or exercise web page.

1. Make sure you are logged in to your own Google Drive page using the account of yours that we gave permission to access files at the EQGW Github site.
2. Make sure you have chosen "Shared with me" from the column of choices on the left side of the Google Drive area.
3. Make sure you have chosen the year and the folder for the appropriate lecture. 
4. You want to have a link that will enable anyone to view that file.
5. Right-click or Crtl-click on the file name.
6. A menu will open.  Choose “Get link”. Select it.
7. When a box open asking about access to the file, choose the setting that states that “Anyone on the internet with this link can view” the file.
8. Leave the permission as "Viewer", do not change it.
9. Above this there will be a green long complicated URL address.  Select "Copy link" which is to its right.  A black box will appear to verify that it has done that.
10. Now, perhaps in another window, get to the page in the EQGW repository for that lecture.
11. Make sure you have chosen the Edit mode (the little pencil icon in the upper-right of the page).
12. At the appropriate place on the page, put in the text you want to appear, and the link.  If the text is "This is the PDF" and the link is symbolized here by HORRIBLYLONGLINK then what you type and paste in on the page is &nbsp; \[This is the PDF](HORRIBLYLONGLINK)  &nbsp;&nbsp;Make sure to type the correct square and curved parentheses in the correct places.
13. Once you have completed pasting in that link and typing that closing curved parenthesis, don’t forget to select the green button for "Commit changes" for that webpage after that.
