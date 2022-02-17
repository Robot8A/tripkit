import Foundation

/// Verkehrsverbund Mainfranken (DE)
public class VvmProvider: AbstractEfaProvider {
    
    static let API_BASE = "https://mobile.defas-fgi.de/vvmapp/"
    static let DEPARTURE_MONITOR_ENDPOINT = "XML_DM_REQUEST"
    static let TRIP_ENDPOINT = "XML_TRIP_REQUEST2"
    static let STOP_FINDER_ENDPOINT = "XML_STOPFINDER_REQUEST"
    
    public override var supportedLanguages: Set<String> { ["de"] }
    
    public init() {
        super.init(networkId: .VVM, apiBase: VvmProvider.API_BASE, departureMonitorEndpoint: VvmProvider.DEPARTURE_MONITOR_ENDPOINT, tripEndpoint: VvmProvider.TRIP_ENDPOINT, stopFinderEndpoint: VvmProvider.STOP_FINDER_ENDPOINT, coordEndpoint: nil, tripStopTimesEndpoint: nil)
        
        styles = [
            "T1": LineStyle(shape: .rect, backgroundColor: LineStyle.parseColor("#fecc02"), foregroundColor: LineStyle.white),
            "T2": LineStyle(shape: .rect, backgroundColor: LineStyle.parseColor("#d81024"), foregroundColor: LineStyle.white),
            "T3": LineStyle(shape: .rect, backgroundColor: LineStyle.parseColor("#00a0e3"), foregroundColor: LineStyle.white),
            "T4": LineStyle(shape: .rect, backgroundColor: LineStyle.parseColor("#02a54f"), foregroundColor: LineStyle.white),
            "T5": LineStyle(shape: .rect, backgroundColor: LineStyle.parseColor("#ca4f98"), foregroundColor: LineStyle.white),
            
            "B6": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#f48472"), foregroundColor: LineStyle.white),
            "B7": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#c656a0"), foregroundColor: LineStyle.white),
            "B8": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#f7931d"), foregroundColor: LineStyle.white),
            "B9": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#a6ce39"), foregroundColor: LineStyle.white),
            "B10": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#f7931d"), foregroundColor: LineStyle.white),
            "B11": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#04b0eb"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B12": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white),
            "B13": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#ca4f98"), foregroundColor: LineStyle.white),
            "B14": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#1ca85e"), foregroundColor: LineStyle.white),
            "B16": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#df1e30"), foregroundColor: LineStyle.white),
            "B17": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#d81024"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B18": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#1ca85e"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B19": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#afcb09"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B20": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#a76701"), foregroundColor: LineStyle.white),
            "B21": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#1ca85e"), foregroundColor: LineStyle.white),
            "B24": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#0d4da0"), foregroundColor: LineStyle.white),
            "B25": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#d81024"), foregroundColor: LineStyle.white),
            "B26": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#ca4f98"), foregroundColor: LineStyle.white),
            "B27": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#f39300"), foregroundColor: LineStyle.white),
            "B28": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#06b0eb"), foregroundColor: LineStyle.white),
            "B29": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#ca4f98"), foregroundColor: LineStyle.white),
            "B33": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#1eb269"), foregroundColor: LineStyle.white),
            "B34": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#a6ce39"), foregroundColor: LineStyle.white),
            "B35": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#f48472"), foregroundColor: LineStyle.white),
            "B48": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#fcd09d"), foregroundColor: LineStyle.white),
            "B50": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#8dd7f7"), foregroundColor: LineStyle.white),
            "B51": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#f58220"), foregroundColor: LineStyle.white),
            "B53": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#939598"), foregroundColor: LineStyle.white),
            "B54": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#8cd7f7"), foregroundColor: LineStyle.white),
            
            "B114": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#d81024"), foregroundColor: LineStyle.white),
            "B191": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#a2c2d1"), foregroundColor: LineStyle.white),
            "B214": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#0d4194"), foregroundColor: LineStyle.white),
            "B292": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#f287b6"), foregroundColor: LineStyle.white),
            "B293": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#f287b6"), foregroundColor: LineStyle.white),
            "B311": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#ee1d23"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B312": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#99ca3b"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B421": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#6c8ac6"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B422": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#f58220"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B423": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#feca0c"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B424": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#02a54f"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B425": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#ee1d23"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B426": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#01aeef"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B427": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#6bcef6"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B428": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#a6ce39"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B430": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#cb4f98"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B431": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#792182"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B436": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#ee1d23"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B441": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#0089a5"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B445": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#0089a5"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B450": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#d81024"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B452": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#06b0eb"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B461": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#afcb09"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B471": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#0d4194"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B472": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#06b0eb"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B480": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#f18372"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B491": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#1ca85e"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B492": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#792182"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B511": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#f39300"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B512": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#d81024"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B521": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#d81024"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B522": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#1ca85e"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B523": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#ca4f98"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B551": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#0d4194"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B552": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#afcb09"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B554": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#1ca85e"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B555": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#d81024"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B560": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#792182"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B610": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#792182"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B612": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#a64486"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B614": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#a6ce39"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B620": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#53c5cf"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B621": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#f58220"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B630": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#01aeef"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B631": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#feca0c"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B632": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#ee1d23"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B633": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#afcb09"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B640": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#02a54f"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B641": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#f166a7"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B642": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#a6ce39"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B644": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#feca0c"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B645": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#939598"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B650": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#f58220"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B652": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#ee1d23"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B654": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#02a54f"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B660": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#00a54f"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B661": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#8dd7f7"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B662": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#feca0c"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B663": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#a78a6b"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B671": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#a6ce39"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B672": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#f58220"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B673": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#6bcef6"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B681": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#939598"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B850": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#879976"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B977": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#53a173"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B992": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#a64486"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B999": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#f58220"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B8036": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#a78a6b"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B8037": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#feca0c"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B8038": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#6bcef6"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0),
            "B8068": LineStyle(shape: .rounded, backgroundColor: LineStyle.parseColor("#afcb09"), backgroundColor2: LineStyle.parseColor("#0089a5"), foregroundColor: LineStyle.white, borderColor: 0)
        ]
    }
    
    override public func queryNearbyLocations(location: Location, types: [LocationType]?, maxDistance: Int, maxLocations: Int, completion: @escaping (HttpRequest, NearbyLocationsResult) -> Void) -> AsyncRequest {
        if let coord = location.coord {
            return mobileCoordRequest(types: types, lat: coord.lat, lon: coord.lon, maxDistance: maxDistance, maxLocations: maxLocations, completion: completion)
        } else {
            completion(HttpRequest(urlBuilder: UrlBuilder()), .invalidId)
            return AsyncRequest(task: nil)
        }
    }
    
    override func queryNearbyLocationsByCoordinateParsing(request: HttpRequest, location: Location, types: [LocationType]?, maxDistance: Int, maxLocations: Int, completion: @escaping (HttpRequest, NearbyLocationsResult) -> Void) throws {
        try queryNearbyLocationsByCoordinateParsingMobile(request: request, completion: completion)
    }
    
    override public func queryDepartures(stationId: String, departures: Bool, time: Date?, maxDepartures: Int, equivs: Bool, completion: @escaping (HttpRequest, QueryDeparturesResult) -> Void) -> AsyncRequest {
        return queryDeparturesMobile(stationId: stationId, departures: departures, time: time, maxDepartures: maxDepartures, equivs: equivs, completion: completion)
    }
    
    override func queryDeparturesParsing(request: HttpRequest, stationId: String, departures: Bool, time: Date?, maxDepartures: Int, equivs: Bool, completion: @escaping (HttpRequest, QueryDeparturesResult) -> Void) throws {
        try queryDeparturesParsingMobile(request: request, stationId: stationId, departures: departures, time: time, maxDepartures: maxDepartures, equivs: equivs, completion: completion)
    }
    
    override public func queryJourneyDetail(context: QueryJourneyDetailContext, completion: @escaping (HttpRequest, QueryJourneyDetailResult) -> Void) -> AsyncRequest {
        return queryJourneyDetailMobile(context: context, completion: completion)
    }
    
    override func queryJourneyDetailParsing(request: HttpRequest, context: QueryJourneyDetailContext, completion: @escaping (HttpRequest, QueryJourneyDetailResult) -> Void) throws {
        try queryJourneyDetailParsingMobile(request: request, context: context, completion: completion)
    }
    
    override public func suggestLocations(constraint: String, types: [LocationType]?, maxLocations: Int, completion: @escaping (HttpRequest, SuggestLocationsResult) -> Void) -> AsyncRequest {
        return mobileStopfinderRequest(constraint: constraint, types: types, maxLocations: maxLocations, completion: completion)
    }
    
    override func suggestLocationsParsing(request: HttpRequest, constraint: String, types: [LocationType]?, maxLocations: Int, completion: @escaping (HttpRequest, SuggestLocationsResult) -> Void) throws {
        try suggestLocationsParsingMobile(request: request, completion: completion)
    }
    
    public override func queryTrips(from: Location, via: Location?, to: Location, date: Date, departure: Bool, tripOptions: TripOptions, completion: @escaping (HttpRequest, QueryTripsResult) -> Void) -> AsyncRequest {
        return queryTripsMobile(from: from, via: via, to: to, date: date, departure: departure, tripOptions: tripOptions, completion: completion)
    }
    
    override func queryTripsParsing(request: HttpRequest, from: Location, via: Location?, to: Location, date: Date, departure: Bool, tripOptions: TripOptions, previousContext: QueryTripsContext?, later: Bool, completion: @escaping (HttpRequest, QueryTripsResult) -> Void) throws {
        try queryTripsParsingMobile(request: request, from: from, via: via, to: to, previousContext: previousContext, later: later, completion: completion)
    }
    
    override public func queryMoreTrips(context: QueryTripsContext, later: Bool, completion: @escaping (HttpRequest, QueryTripsResult) -> Void) -> AsyncRequest {
        return queryMoreTripsMobile(context: context, later: later, completion: completion)
    }
    
    public override func refreshTrip(context: RefreshTripContext, completion: @escaping (HttpRequest, QueryTripsResult) -> Void) -> AsyncRequest {
        return refreshTripMobile(context: context, completion: completion)
    }
    
    override func refreshTripParsing(request: HttpRequest, context: RefreshTripContext, completion: @escaping (HttpRequest, QueryTripsResult) -> Void) throws {
        try refreshTripParsingMobile(request: request, context: context, completion: completion)
    }
    
}
