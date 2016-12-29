var React = require('react');
var SearchBox = require('./SearchBox.jsx');
var NavBox = require('./NavBox.jsx');



var Travel = React.createClass({

  getInitialState: function() {
    return { searchItem: {}, windowSize: {} }
  },

  componentWillMount: function() {
    this.getWindowSize();
  },

  getWindowSize: function() {
    var windowW = window.innerWidth;
    var windowH = window.innerHeight;
    var size = {width: windowW, heigth: windowH };
    var heightStyle = {height: windowH.toString() + "px"};
    this.setState({windowSize: size, heightStyle: heightStyle});
  },

  setSearchItem: function(value) {
    var wojtek = value.destination;
    this.setState({searchItem: value}, function() {
      
    });
    
  },


  render: function() {
    if (this.state.windowSize.width <= 500 ) {
       return (
         <div>
          <div id="landing-container">
            <NavBox windowSize={this.state.windowSize}/>
            <h1 id="logo"><span id="travel-word">Travel</span> <span id="guide-word">Guide</span></h1>
          </div>
          <SearchBox setState={this.setState} setSearch={this.setSearchItem}/>
        </div>
      );
    } 

    if(this.state.windowSize.width >= 1000) {
      return (
        <div>  
          <div id="landing-container" style={this.state.heightStyle}>
          <NavBox windowSize={this.state.windowSize}/>
            <h1 id="logo"><span id="travel-word">Travel</span> <span id="guide-word">Guide</span></h1>
            <SearchBox setState={this.setState} setSearch={this.setSearchItem}/>
          </div>
        </div>
        );
    }   
  }
});

module.exports = Travel;