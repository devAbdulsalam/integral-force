import 'style.css'
import { useState } from 'react';
import { integral_force_backend } from 'declarations/integral-force-backend';
import Score from './components/Score'
import questions from './questions'
function App() {
  const [name, setName] = useState('');
  const [isQuiz, setIsQuiz] = useState(false);
  const [isHome, setIsHome] = useState(false);
  const [isScore, setIsScore] = useState(false);
  function handleSubmit(event) {
    event.preventDefault();
    const name = event.target.elements.name.value;
    integral_force_backend.greet(name).then((greeting) => {
      setName(greeting);
    });
    setIsQuiz(true);
    return false;
  }


  return (
        <main className="main">
			<header className="header">
				<a href="#" className="logo">Quiz</a>

				<nav className="navbar">
					<a href="#" className="active">Home</a>
				</nav>

				<div id="navigation">
					<nav id="side-navbar">
						<p onClick={() => setIsHome(!isHome)} className="active">Home</p>
					</nav>
					<nav id="side-navbar">
						<p onClick={() => setIsQuiz(!isQuiz)} className="active">Quiz</p>
					</nav>
					<nav id="side-navbar">
						<p onClick={() => setIsScore(!isScore)} className="active">Score</p>
					</nav>
					<div id="menuBtn">
						<i className="bx bx-menu-alt-right" id="menu"></i>
					</div>
				</div>
			</header>			
			{isHome && (
				 <>
				 <img src="/logo2.svg" alt="DFINITY logo" />
				 <br />
				 <br />
				 <form action="#" onSubmit={handleSubmit}>
				   <label htmlFor="name">Enter your name: &nbsp;</label>
				   <input id="name" alt="Name" type="text" />
				   <button type="submit">Submit</button>
				 </form>
				 </>
			)}
			{isQuiz && (
				<>
				<div className="container">
					<section className="quiz-section">
						<div className="quiz-box">
							<h1>{name}</h1>
							<div className="quiz-header">
								<span>Corruption Tutorials</span>
								<span className="header-score">Score:0/5</span>
							</div>
							<h2 className="question-text">What is corruption?</h2>
							<div className="option-list">
								<div className="option">
									<span>A. </span>
								</div>
								<div className="option">
									<span>B. </span>
								</div>
								<div className="option">
									<span>C.</span>
								</div>
								<div className="option">
									<span>D. </span>
								</div>
							</div>

							<div className="quiz-footer">
								<span className="question-total">1 of 5 Questions</span>
								<button className="next-btn">Next</button>
							</div>
						</div>

						<div className="result-box">
							<h2>Quiz Result!</h2>
							<div className="percentage-container">
								<div className="circular-progress">
									<span className="progress-value">0%</span>
								</div>

								<span className="score-text">Your Score 0 out of 5</span>
							</div>

							<div className="buttons">
								<button className="tryAgain-btn">Try Again</button>
								<button className="goHome-btn">Go To Home</button>
							</div>
						</div>
					</section>
				</div>

				<section className="home">
					<div className="home-content">
						<h1>Quiz Whiz</h1>
						<p>
							Welcome To Quiz Whiz! Test your Knowledge, Challenge friends and see
							if you have what it takes to be an ultimate trivia on corruption.
						</p>
						<button className="start-btn">Start Quiz</button>
					</div>
				</section>
			</>
			)}
      		{isScore && <Score name={name} />}	
		</main>
    )
}

export default App