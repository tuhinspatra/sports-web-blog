window.onload = function() {

    function FauxGif(element, frames, speed) {
        this.currentFrame = 0,
        this.domElement   = element,
        this.frames       = frames || null,
        this.speed        = speed  || 200;
        this.interval;
        this.init();
    }

    FauxGif.prototype = {
        init: function() {
            // set the first one to the first image
            console.log(this.frames[0])
            this.domElement.style.backgroundImage = "url(" + this.frames[0] + ")";
        },
        pause: function() {
            clearInterval(this.interval);
        },
        resume: function() {
            var that = this;

            that.interval = setInterval(function(){
                that.currentFrame < that.frames.length - 1 ? that.currentFrame++ : that.currentFrame = 0;
                that.domElement.style.backgroundImage = "url(" + that.frames[that.currentFrame] + ")";
            }, this.speed);
        }
    }

    var frames = [
                    'fr2/8.jpg','fr2/9.jpg','fr2/10.jpg','fr2/11.jpg','fr2/12.jpg','fr2/13.jpg',
                    'fr2/14.jpg','fr2/15.jpg','fr2/16.jpg','fr2/17.jpg','fr2/18.jpg','fr2/19.jpg'
            ]

var elem = document.querySelector('#faux-gif'),
    gif  = new FauxGif(elem, frames);


elem.addEventListener('mouseenter', function(){
    gif.resume()
});

elem.addEventListener('mouseleave', function() {
    gif.pause();
});
}
