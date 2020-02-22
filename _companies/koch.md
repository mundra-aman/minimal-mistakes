---
title: "Koch"
excerpt: "Founded by Fred C. Koch in 1940 with a current revenue of ‎US $110 billion (2019)"
share: "false"
header:
  image: 
  teaser: assets/images/business/koch.jpg


---

<style type="text/css">
	
ul.timeline {
    list-style-type: none;
    position: relative; }

ul.timeline:before {
    content: ' ';
    background: #d4d9df;
    display: inline-block;
    position: absolute;
    left: 29px;
    width: 2px;
    height: 100%;
    z-index: 400; }

ul.timeline > li {
    margin: 20px 0;
    padding-left: 20px; }

ul.timeline > li:before {
    content: ' ';
    background: white;
    display: inline-block;
    position: absolute;
    border-radius: 50%;
    border: 3px solid #22c0e8;
    left: 20px;
    width: 20px;
    height: 20px;
    z-index: 400; }
</style>


@import url('https://fonts.googleapis.com/css?family=Oswald|Roboto:400,700');
.container {
	max-width: 1024px;
	width: 90%;
	margin: 0 auto;
}

$border-color: rgba(black, .3);

.timeline-item {
	padding: 3em 2em 2em;
	position: relative;
	color: rgba(black, .7);
	border-left: 2px solid $border-color;
		
	&::before {
		content: attr(date-is);
		position: absolute;
		left: 2em;
		font-weight: bold;
		top: 1em;
		display: block;
		font-family: 'Roboto', sans-serif;
		font-weight: 700;
		font-size: .785rem;
	}

	&::after {
		width: 10px;
		height: 10px;
		display: block;
		top: 1em;
		position: absolute;
		left: -7px;
		border-radius: 10px;
		content: '';
		border: 2px solid $border-color;
		background: white;
	}

	&:last-child {
		border-image: linear-gradient(
			to bottom,
			$border-color 60%,
			rgba($border-color, 0)) 1 100%
		;
	}
}


<div class="container">
	<ul class="timeline">
		<li>
			<a target="_blank" href="https://www.totoprayogo.com/#">New Web Design</a>
			<a href="#" class="float-right">21 March, 2014</a>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque scelerisque diam non nisi semper, et elementum lorem ornare. Maecenas placerat facilisis mollis. Duis sagittis ligula in sodales vehicula....</p>
		</li>
		<li>
			<a href="#">21 000 Job Seekers</a>
			<a href="#" class="float-right">4 March, 2014</a>
			<p>Curabitur purus sem, malesuada eu luctus eget, suscipit sed turpis. Nam pellentesque felis vitae justo accumsan, sed semper nisi sollicitudin...</p>
		</li>
		<li>
			<a href="#">Awesome Employers</a>
			<a href="#" class="float-right">1 April, 2014</a>
			<p>Fusce ullamcorper ligula sit amet quam accumsan aliquet. Sed nulla odio, tincidunt vitae nunc vitae, mollis pharetra velit. Sed nec tempor nibh...</p>
		</li>
	</ul>	
</div>