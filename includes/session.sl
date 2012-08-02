<%

class Session {
    def init(cookie_name) {
        @cookie_name = cookie_name;
        load();
    }
    
    def [](key) {
        @data[key];
    }
    
    def []=(key, value) {
        @dirty = true;
        @data[key] = value;
    }
    
    def load {
        if data = Request.cookies[@cookie_name] and verify_signature(data) {
            @data = JSON.decode(data.split("--")[0].url_decode);
        } else {
            @data = {};
        }
    }
    
    def compute_signature(payload) {
        GCrypt::SHA1.hex_digest(CONFIG["secret_key"] + payload);
    }
    
    def sign_payload(payload) {
        payload + "--" + compute_signature(payload);
    }
    
    def verify_signature(data) {
        [payload, signature] = data.split("--");
        signature == compute_signature(payload);
    }
    
    def save {
        if @dirty {
            payload = JSON.encode(@data).url_encode;
            Response.set_cookie(@cookie_name, sign_payload(payload));
        }
    }
    
    def destroy {
        Response.set_cookie(@cookie_name, "");
    }
    
    def inspect {
        "#<Session: " + @data.inspect + ">";
    }
}