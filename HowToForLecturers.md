
# Evolutionary Quantitative Genetics Workshop #

|        |        |        |    |
|--------|---------------------------------------------|--------------------|------------------------------------------|
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [2021 Workshop (Online)](/index.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [SCHEDULE](/2021/schedule.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Resources](/2021/resources.html) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [PREVIOUS YEARS](https://blogs.uw.edu/fhleqg/previous-years) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |


<div align="left">
<img src="/media/FHLimage2018b.jpg" alt="FHL waterfront in 2018">
</div>

WARNING: Joe is still editing this page, so do not trust its instructions (yet)


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
will be called &nbsp; lecture3-2.html

If when you go to find the pages, you do not 
see the folder for the year, you might see a link called "Code" which will make it visible.

1.  Look in the year folder, and verify that there is no file of that name.  If there is such a file,
skip this section of these instructions and go to the next section, which tells how to edit the file.
2.  If there is no file for the lecture, start out by clicking on the filename of some other lecture ".md" file
3.  It will be brought up in edit mode.  Copy all the contents of that file.  Do not change anything in that file or a fellow lecturer, whose lecture that is, will get upset with you.
4.  Now go to the filename above in the page and click on the year.  The list of existing pages will appear, in their ".md" forms.
5.  Above them and to the right you will also see a button that says "Add new file".  Choose it.  
6.  From the drop-down menu that appears, choose "Create new file".  This should open the file for editing.  You will see a 
line number (1) on the first line, at the left side of the editing area.  Above that area you will see that there is a path for the name of the file, but with the final part of the name empty, represented by a box.  Type the filename into that box.  For example, if the lecture is  lecture3-2, type in "lecture3-2.md" (without the quotes).
7. Go to the text immediately after line 1, put your cursor there and paste in all the contents of that other webpage.
8. Of course some of it is different from what you want, so set to work editing it.  Make sure to note the markdown code that makes the links to the previous and the next lectures, and correct those.  Also, of course, correct the heading that announces the number of the lecture.   One subtle point of Markdown syntax is that if you are highlighting text, or changing headers, _make sure you understand whether there should be a blank before or after the text being highlighted_. (Generally, yes for headers, no for text). 
9. To figure out Markdown syntax, open a new window on your desktop and in it search for "Github Markdown" and look at some set of easy instructions.
10. You can see roughly what the page will look like by clicking on the eyeball which is to the right of Edit, at the top of the editing area.
11. **__But__** whatever you do, when you are ready to go elsewhere, _don't_ until you go down to the green button that asks you to Commit your content, and press that so that it changes color.  Otherwise, of course, you will lose everything you did when you leave.

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
7. You can see roughly what the page will look like by clicking on the eyeball which is to the right of Edit, at the top of the editing area.
8. **__But__** whatever you do, when you are ready to go elsewhere, _don't_ until you go down to the green button that asks you to Commit your content, and press that so that it changes color.  Otherwise, of course, you will lose everything you did when you leave.

You probably want to link to PDF or PPT files of slides, to files of R exercises, and other media.  Do <em>not put these files into our Github repository</em>, but instead post those files to the appropriate folder for Google Drive for the fhleqg Gmail account.  Use the instructions below for “posting files to be linked to from the web page” and also the instructions below that for obtaining the link for each such file to make a link from the web page that you are creating in this list of instructions.
 

## Posting files to be linked to from the web page ##

***After here in this section, not changed yet to reflect access of these folders by link, which is necessary because of two-factor authentication craziness which has the effect of making it impossible to let us all log in to the Google account of the Workshop***

Files such as lecture projections (PPT or PDF), or supplementary documents, or R exercises, or audio recordings, are not to be posted on the workshop blog.  Instead, open the Google Drive for the  fhleqg  account, which is not a gmail account but a  uw.edu  account.  It has the password we mentioned above.

Find the “Shared folder” and open it, then find the folder for this year (such as “2019”) and open that.  Find the folder for the lecture or exercise, and open that.  If it does not exist, right-click or Ctrl-click and choose New Folder, and give it the appropriate name such as  Lecture 4.3.

Then you should be able to tow the file from your system onto that Drive screen and drop it there.  You can change its name once it is there, if you want.

 

## Getting the link for one of those files ##

But there is still the matter of getting the address of the file, and posting a link to it on the appropriate lecture or exercise web page.

***After here in this section, not changed yet to reflect access of these folders by link, which is necessary because of two-factor authentication craziness making it impossible to let you all log in to the Google account of the Workshop.  Still, some of this will work.***

_(Can't do this anymore)_ Open a window with the Google Drive page, with you logged in appropriately.
Find the folder with the file, and open that folder.
(You may need to do this only once)  The files you put in the Google Drive folders should be accessible by anyone who has the link.  This ensures that clicking on the link in the blog reaches the file.  To make that select the file and click on the icon above and to the right that looks a person with a + sign on their shoulder.  Choose the setting that states that “anyone with the link can view” the file (not just anyone at UW with a link).
Right-click or Crtl-click on the file name.
A menu will open.  Choose “Get Sharable Link”.
A box will open with the URL address for the link.  Select it and copy it.
_(This next part needs to be changed, too)._ Now go to the Edit screen for the blog page, in Visual mode.  Have the text that will indicate the link selected.
Choose the symbol for Insert/Edit Link, which looks like a little chain with three links.
Insert the URL in the box provided.
Press the return-arrow button which immediately follows the URL field.
Don’t forget to Publish or Update the web page after that.
