findPhonesCapicuaByPrefix = function (prefix) {
    const prefixes = [21, 22, 231, 232, 233, 234 ];
    
    if (!prefixes.includes(prefix)) {
        return "Invalid prefix: " + prefixes.join(', ');
    }

    return db.phones.find({
        "components.prefix": prefix,
        $where: function () {
            var numberPart = this.display.split('-')[1]; // Get the second part of the number
            return numberPart === numberPart.split('').reverse().join(''); // Check if it's a capicua
        }
    });
}
