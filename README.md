<h1>MUSIC-algorithm simulation - Line spectrum analysis and estimation using MATLAB</h1>


<h2>Description</h2>
I made this MUSIC-algorithm simulation for my bachelor's thesis work. The aim of this simulation is to compare the efficiency and accuracy of the two MUSIC-algorithm variants discussed in my thesis: root-MUSIC and (spectral)MUSIC. Their accuracy is tested as a function of incomming sinusoids, signal-to-noise ratio and the size of the autocorrelation matrix. The algorithms are tested on how accurately they can find the frequencies of incomming sinusoids in noise. Basics of the subject can be found e.g. at <a href="https://en.wikipedia.org/wiki/MUSIC_(algorithm)"> Wikipedia</a>.
<br />

<h2>Results</h2>
In breaf, both algorithms offer accurate line spectrum estimation. In most cases root-MUSIC is more accurate and efficient especially when e.g. the signal-to-noise ratio is bad. 


<h2>What I learned</h2>

- <b>Practical usage of the MUSIC and root-MUSIC-algorithms</b>
- <b>Monte Carlo simulations</b>
- <b>Efficiency analysis</b> 
- <b>Programming project structuring</b> 


<h2>Simulation files</h2>

- "snr_test.m", signal to noise ratio test
- "m_test.m", autocorrelation matrix size test
- "n_test.m", incomming sinusoids test
- "spektri.m", file for MUSIC-pseudospectrum plotting
- "create_set_signal.m", function for the creation of the time-series
- "calc_musics.m", function for frequency estimations
- "calc_musicsv2.m", function for frequency estimations and efficiency calculations
- "MSEv5.m", function for mean squared error

Note: The program has been commented in Finnish to match the language of the thesis.
