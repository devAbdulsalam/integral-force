const App = () => {
    return (
        <div className="popup-info">
        <h2>Quiz Guide</h2>
        <span className="info"
            >1. Choose your answers currently because once picked, you will not be
            able to change it.</span>
        <span className="info">2. Beat The Clock (10 seconds)</span>
        <span className="info">
            3. Focus On The Current Question Before Moving To The Next One.
            </span >



        <div className="btn-group">
            <button className="info-btn exit-btn" onclick="hideSection()">
                Exit Quiz
            </button>
            <a href="#" className="info-btn continue-btn" onclick="showSection()"
                >Continue</a>        </div>
    </div> 
    )
}

export  default App