module.exports = function () {
    
    this.init = function(success, error) {
        //console.log('SpeechRecognitionPlugin: init');
        this.success = success;
        this.error = error;
    };

    this.displayDimentions = function() {
        //console.log('SpeechRecognitionPlugin: start');
        return cordova.exec(this.success, this.error, "DeviceControl", "displayDimentions", []);
    };

}
