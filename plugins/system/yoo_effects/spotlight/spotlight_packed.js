
/* (C) 2008 YOOtheme.com */
var YOOSpotlight=new Class({initialize:function(B,A){this.setOptions({duration:600,transition:Fx.Transitions.quadInOut,wait:false},A);$$(B).each(function(D,C){if((D.getTag()=="div"||D.getTag()=="span")&&D.getStyle("background-image")!="none"){this.createOver(D,C)}}.bind(this))},createOver:function(D,C){var E=D.getStyle("background-image").replace(/^(\S+)\.(gif|jpg|jpeg|png)/,"$1_spotlight.$2");var B=new Element(D.getTag(),{styles:D.getStyles("width","height")});var A=new Fx.Styles(B,this.options);B.setStyles({display:"block","background-image":E,opacity:0});B.injectInside(D);D.addEvent("mouseenter",function(F){A.start({opacity:1})}.bind(this));D.addEvent("mouseleave",function(F){A.start({opacity:0})}.bind(this))}});YOOSpotlight.implement(new Options);window.addEvent("load",function(){new YOOSpotlight("div.spotlight, span.spotlight")});