<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
  <meta charset="utf-8">
    <title>HTML</title>
    <style>
      video { max-width: 80%; display: block; margin: 20px auto; }
    </style>
  </head>
  <body>
    <video controls poster="resource/images/Title.png">
      <source src="resource/images/Test.mp4" type="video/mp4">
      <strong>Your browser does not support the video tag.</strong>
    </video>
    	<iframe width="560" height="315"
		src="https://www.youtube.com/embed/ISKi-ZoJvHg?si=Oj6r5AVROe4MwRqj" title="YouTube video player"
		frameborder="0"
		allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
		allowfullscreen></iframe>
  </body>
</html>

