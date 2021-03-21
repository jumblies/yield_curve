<script>

options: {
				responsive: true,
				scales: {
					      xAxes: [{
							type: 'linear',
							position: 'bottom',
							ticks: {
								display: true, 
								fontColor: "#85bb65",
								fontSize: 10, 
							    stepSize: 3,
							    padding: 1,
							    //~ maxRotation: 0,
							    minRotation: 90,
								callback: function(label, index, labels) {
									//~ console.log(label);
									switch (label) {
										//~ case 0:
											//~ return 'ZERO';
										case 3:
											return '3M';
										case 6:
											return '6M';
										case 12:
											return 'ONE';
										case 24:
											return 'TWO';
										case 36:
											return 'THREE';
										case 48:
											return 'FOUR';
										case 60:
											return 'FIVE';
										case 84:
											return 'SEVEN';
										case 120:
											return 'TEN';
										case 240:
											return 'TWENTY';
										case 360:
											return 'THIRTY';
									}
								}
							//~ }
							},
						  }],
					yAxes: [{
						ticks: {
								display: true, 
								fontColor: "#85bb65",
								fontSize: 16, 
							beginAtZero: false
							
						}
					}]
				}
			}
    </script>