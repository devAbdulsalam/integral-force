
function App({name}) {
    return(
<div className="card">
			<section className="card-info card-section">
				<i className="ion-navicon menu"></i>
				<i className="ion-ios-search search"></i>

				<div className="avatar row"></div>

				<section className="user row">
					<h1 className="user-header">
						{name}
						<h2 className="sub header">400 hours</h2>
					</h1>
				</section>

				<section className="statistics">
					<article className="statistic">
						<h4 className="statistic-title">Top score</h4>
						<h3 className="statistic-value">360</h3>
					</article>

					<article className="statistic">
						<h4 className="statistic-title">Score</h4>
						<h3 className="statistic-value">1,034</h3>
					</article>
				</section>

				<div className="dial">
					<h2 className="dial-title">5</h2>
					<h3 className="dial-value">Level</h3>
				</div>
			</section>
			<section className="card-details card-section">
				<nav className="menu">
					<article className="menu-item menu-item-active">Topics</article>
					<article className="menu-item">Friends</article>
				</nav>

				<dl className="leaderboard">
					<dt>
						<article className="progress">
							<section className="progress-bar" style="width: 85%"></section>
						</article>
					</dt>
					<dd>
						<div className="leaderboard-name">What is corruption?</div>
					</dd>
					<dt>
						<article className="progress">
							<section className="progress-bar" style="width: 65%"></section>
						</article>
					</dt>
					<dd>
						<div className="leaderboard-name">Types of corruption</div>
					</dd>
					<dt>
						<article className="progress">
							<section className="progress-bar" style="width: 60%"></section>
						</article>
					</dt>
					<dd>
						<div className="leaderboard-name">Preventing corruption</div>
					</dd>
					<dt>
						<article className="progress">
							<section className="progress-bar" style="width: 55%"></section>
						</article>
					</dt>
					<dd>
						<div className="leaderboard-name">Duties of citizens</div>
					</dd>
				</dl>
			</section>
		</div>  );
}

export default App;